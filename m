Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZZb-0004Li-4J
 for ath11k@lists.infradead.org; Mon, 16 Nov 2020 08:09:16 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v3 0/3] ath11k: vdev and peer delete synchronization with
 firmware
Date: Mon, 16 Nov 2020 13:39:00 +0530
Message-Id: <1605514143-17652-1-git-send-email-mkenna@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

When add an interface immediately after removing the interface,
vdev deletion in firmware might not have been completed.
add vdev_delete_resp_event and wait_event_timeout to synchronize
with firmware.

Peer creation in firmware fails if last peer deletion is still in
progress, add wait for the event after deleting every peer from host
driver to synchronize with firmware.

1) add vdev delete resp event and wait event to get ack from firmware
2) add wait event timeout for peer delete to get ack from firmware
3) code clean up and replace the api 'ath11k_mac_get_ar_vdev_stop_status'
   with 'ath11k_mac_get_ar_by_vdev_id'

V3: Rebased on latest ath.git TOT & added correct version name
    in the subject name in the patches.
V2: Rebased on latest ath.git TOT - Addressed Kalle's comment.

Ritesh Singh (3):
  ath11k: vdev delete synchronization with firmware
  ath11k: peer delete synchronization with firmware
  ath11k: remove "ath11k_mac_get_ar_vdev_stop_status" references

 drivers/net/wireless/ath/ath11k/core.c |  2 +
 drivers/net/wireless/ath/ath11k/core.h |  9 ++--
 drivers/net/wireless/ath/ath11k/mac.c  | 82 ++++++++++++++++------------------
 drivers/net/wireless/ath/ath11k/mac.h  |  2 -
 drivers/net/wireless/ath/ath11k/peer.c | 44 ++++++++++++++++--
 drivers/net/wireless/ath/ath11k/peer.h |  2 +
 drivers/net/wireless/ath/ath11k/wmi.c  | 81 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/wmi.h  |  4 ++
 8 files changed, 166 insertions(+), 60 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
