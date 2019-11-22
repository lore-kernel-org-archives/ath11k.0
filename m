Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY6K9-0002jg-Qf
 for ath11k@lists.infradead.org; Fri, 22 Nov 2019 10:38:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Advertise MPDU start spacing as no restriction
References: <1573447702-30398-1-git-send-email-vnaralas@codeaurora.org>
Date: Fri, 22 Nov 2019 10:37:59 +0000
In-Reply-To: <1573447702-30398-1-git-send-email-vnaralas@codeaurora.org>
 (Venkateswara Naralasetty's message of "Mon, 11 Nov 2019 10:18:22
 +0530")
Message-ID: <0101016e92b09f4d-9483a82a-64eb-4441-a100-e51a2040ca8e-000000@us-west-2.amazonses.com>
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> writes:

> Adverise MPDU start spacing as no restriction in ht capabilities,
> Since IPQ8074 hw support all sorts of mpdu start spcing. With this
> observed minor uplink performance improvement in lower data frame
> size case with Veriwave clients.
>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Applied, thanks.

2bce98caf793 ath11k: Advertise MPDU start spacing as no restriction

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
