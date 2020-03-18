Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEXHM-00088k-0E
 for ath11k@lists.infradead.org; Wed, 18 Mar 2020 11:54:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv4 1/2] ath11k: Configure hash based reo destination ring
 selection
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1584445023-17384-2-git-send-email-srirrama@codeaurora.org>
References: <1584445023-17384-2-git-send-email-srirrama@codeaurora.org>
Message-Id: <20200318115429.7F11CC432C2@smtp.codeaurora.org>
Date: Wed, 18 Mar 2020 11:54:29 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> Current implementation of pdev based reo destination ring
> selection is replaced by hash based ring selection so as to
> ensure all the available rings are utilized for better performance.
> 
> The 4 reo destination rings are selected by the HW based on the
> hash value computed from the received packet based on the 5 tuple
> {ip src/ip dst/src port/dst port/protocol}. Out of the 32 hash values
> used by the hw, the driver assigns 8 values per reo destination ring
> to each of the 4 reo destination rings.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

26c79927f123 ath11k: Configure hash based reo destination ring selection
acc79d981c14 ath11k: Perform per-msdu rx processing

-- 
https://patchwork.kernel.org/patch/11442547/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
