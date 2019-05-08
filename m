Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOJDj-0000gj-1b
 for ath11k@lists.infradead.org; Wed, 08 May 2019 09:50:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] ath11k: init/deinit monitor rings
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557154496-12059-2-git-send-email-milehu@codeaurora.org>
References: <1557154496-12059-2-git-send-email-milehu@codeaurora.org>
Message-Id: <20190508095038.C01EE60AA2@smtp.codeaurora.org>
Date: Wed,  8 May 2019 09:50:38 +0000 (UTC)
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
To: Miles Hu <milehu@codeaurora.org>
Cc: ath11k@lists.infradead.org

Miles Hu <milehu@codeaurora.org> wrote:

> extend ring setup/cleanup to generic functions.
> init/deinit monitor status/buffer/destination/link rings.
> more htt filters for monitor mode.
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>

6 patches applied to ath.git, thanks.

a7e7c50ca095 ath11k: init/deinit monitor rings
c4e302228175 ath11k: monitor filter set function
db308ba7f43a ath11k: htt setup monitor rings
820370c8f81d ath11k: monitor mode attach/detach
5f201992710f ath11k: enable/disable monitor mode and destination ring entry process
a8c71066a0b2 ath11k: merge msdu tlv process and status/destination ring process

-- 
https://patchwork.kernel.org/patch/10931185/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
