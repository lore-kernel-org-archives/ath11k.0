Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT0JI-0000yw-NT
 for ath11k@lists.infradead.org; Mon, 27 Apr 2020 09:44:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 0/2] ath11k: fix mgmt_tx_wmi cmd sent for deleted vdev
References: <1587894269-4020-1-git-send-email-murugana@codeaurora.org>
Date: Mon, 27 Apr 2020 12:44:14 +0300
In-Reply-To: <1587894269-4020-1-git-send-email-murugana@codeaurora.org>
 (Sathishkumar Muruganandam's message of "Sun, 26 Apr 2020 15:14:27
 +0530")
Message-ID: <87v9llfekx.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> writes:

> This patch set adds fix for the case of mgmt_tx_wmi cmd sent
> to FW for deleted vdev.
>
> And also patch having DBG_MAC prints to track vdev events which
> will help in debugging.
>
> Sathishkumar Muruganandam (2):
>   ath11k: fix mgmt_tx_wmi cmd sent to FW for deleted vdev
>   ath11k: add DBG_MAC prints to track vdev events

You need to Cc linux-wireless so that patchwork sees it. Please submit
v3.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
