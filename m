Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRugc-0000vG-0d
 for ath11k@lists.infradead.org; Fri, 24 Apr 2020 09:31:55 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH 0/2] mac80211: enable TKIP when using encapsulation offloading
Date: Fri, 24 Apr 2020 15:01:28 +0530
Message-Id: <1587720690-2753-1-git-send-email-murugana@codeaurora.org>
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

TKIP was disabled on encap offload mode since if TKIP MIC error
reporting is not capable by the driver using encap offload mode,
then TKIP countermeasures wont work.

Enabling back TKIP bring-up in encap offload mode to leave the
control with the driver to disable hw encap when it is not capable
of TKIP MIC error reporting.

Sathishkumar Muruganandam (2):
  mac80211: enable TKIP when using encapsulation offloading
  ath11k: add 802.3 undecap support to fix TKIP MIC error reporting

 drivers/net/wireless/ath/ath11k/dp_rx.c | 39 ++++++++++++++++++++++++++++++++-
 net/mac80211/iface.c                    |  7 ------
 net/mac80211/key.c                      |  7 ------
 3 files changed, 38 insertions(+), 15 deletions(-)

-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
