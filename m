Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHVcf-0006OW-3H
 for ath11k@lists.infradead.org; Thu, 26 Mar 2020 16:44:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: add pktlog checksum in trace events to support
 pktlog
References: <1585234155-30574-1-git-send-email-mkenna@codeaurora.org>
Date: Thu, 26 Mar 2020 18:44:34 +0200
In-Reply-To: <1585234155-30574-1-git-send-email-mkenna@codeaurora.org>
 (Maharaja Kennadyrajan's message of "Thu, 26 Mar 2020 20:19:15 +0530")
Message-ID: <87k137oykt.fsf@tynnyri.adurom.net>
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> writes:

> Pktlog data are different among the chipset & chipset versions.
> As part of enhancing the user space script to decode the pktlog
> trace events generated, it is desirable to know which chipset or
> which chipset version has provided the events and thereby decode
> the pktlogs appropriately.
>
> Pktlog checksum helps to determine the chipset variant which is
> given by the firmware in the struct wmi_ready_event.
>
> Pktlog checksums are computed during the firmware build.
> So, adding that pktlog checksum in the pklog trace events.
>
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>

When you send a new version please always increase the version number
(in this case this should be v2), even if just the email address has
changed. That way I can immediately see which version to take.

But no need to resend just because of this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
