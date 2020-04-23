Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRgB1-0008Op-K3
 for ath11k@lists.infradead.org; Thu, 23 Apr 2020 18:02:26 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH 0/2] fix mgmt_tx_wmi cmd sent for deleted vdev
Date: Thu, 23 Apr 2020 23:31:37 +0530
Message-Id: <1587664899-1950-1-git-send-email-murugana@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

This patch set adds fix for the case of mgmt_tx_wmi cmd sent
to FW for deleted vdev.

And also patch having DBG_MAC prints to track vdev events which
will help in debugging.

Sathishkumar Muruganandam (2):
  ath11k: fix mgmt_tx_wmi cmd sent to FW for deleted vdev
  ath11k: add DBG_MAC prints to track vdev events

 drivers/net/wireless/ath/ath11k/mac.c | 37 ++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
