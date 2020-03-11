Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC43G-00039w-1Q
 for ath11k@lists.infradead.org; Wed, 11 Mar 2020 16:17:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2 2/2] ath11k: Perform per-msdu rx processing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1581908873-14749-3-git-send-email-srirrama@codeaurora.org>
References: <1581908873-14749-3-git-send-email-srirrama@codeaurora.org>
Message-Id: <20200311161738.B929AC432C2@smtp.codeaurora.org>
Date: Wed, 11 Mar 2020 16:17:38 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Tamizh Chelvam Raja <tamizhr@codeaurora.org>

Sriram R <srirrama@codeaurora.org> wrote:

> As Hash based reo destination selection is configured,
> the decapped packets reach different reo destintion rings
> based on the destintaion ring selected for the computed hash (based on
> the 5-tuple {ip src/ip dst/src port/dst port/protocol}) by hw and
> as configured by driver.
> 
> Hence the current implementation of amsdu list based processing after all
> the subframes of amsdu are received (since all msdu's for a pdev are
> received in same reo dest ring), is not applicable here and hence is
> replaced with per msdu based handling as these subframes
> can be received in different reo dest rings.
> 
> Also, as some of the rx descriptor fields might be valid only for the
> first msdu (for ex. received 80211 header, encryption type, etc),
> it might not be useful now as we cannot sync between different
> subframes received in different rings. Hence do not rely on those
> fields and replace them with fieds valid only on per msdu descriptors.
> Also cache other details such as encryption type for a peer so that
> it can be reused when a packet is received from it.
> 
> Co-developed-by: Tamizh Chelvam Raja <tamizhr@codeaurora.org>
> Signed-off-by: Tamizh Chelvam Raja <tamizhr@codeaurora.org>
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

New warnings:

drivers/net/wireless/ath/ath11k/dp_rx.c:2010: multiple assignments should be avoided
drivers/net/wireless/ath/ath11k/dp_rx.c:2160: Please don't use multiple blank lines

Fixed in the pending branch.

-- 
https://patchwork.kernel.org/patch/11385033/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
