Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLUSK-0005dc-06
 for ath11k@lists.infradead.org; Mon, 06 Apr 2020 16:18:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add pktlog checksum in trace events to support
 pktlog
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1585234155-30574-1-git-send-email-mkenna@codeaurora.org>
References: <1585234155-30574-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200406161833.D0CC9C433F2@smtp.codeaurora.org>
Date: Mon,  6 Apr 2020 16:18:33 +0000 (UTC)
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

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

21c1b063f4b9 ath11k: add pktlog checksum in trace events to support pktlog

-- 
https://patchwork.kernel.org/patch/11460287/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
