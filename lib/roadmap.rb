module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get(base_api_endpoint("roadmaps/#{roadmap_id}"), headers: { "authorization" => @auth_token })
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(base_api_endpoint("checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    @checkpoint = JSON.parse(response.body)
  end

  def create_submission(assignment_branch, assignment_commit_link, checkpoint_id, comment, enrollment_id)
    submit_checkpoint = self.class.post(base_api_endpoint("checkpoint_submissions"),
    body: {"assignment_branch": assignment_branch, 
           "assignment_commit_link": assignment_commit_link, 
           "checkpoint_id": checkpoint_id, 
           "comment": comment,
           "enrollment_id": enrollment_id,
            }, headers: { "authorization" => @auth_token })
  end

end