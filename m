Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKHvy-0005uH-Up
 for ath11k@lists.infradead.org; Mon, 21 Sep 2020 09:16:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: driver for Qualcomm IEEE 802.11ax devices
References: <33a79f41-e113-1315-871b-97842776a2a4@canonical.com>
Date: Mon, 21 Sep 2020 12:16:11 +0300
In-Reply-To: <33a79f41-e113-1315-871b-97842776a2a4@canonical.com> (Colin Ian
 King's message of "Fri, 18 Sep 2020 15:11:53 +0100")
Message-ID: <875z87bick.fsf@codeaurora.org>
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
To: Colin Ian King <colin.king@canonical.com>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Govindaraj Saminathan <gsamin@codeaurora.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Bhagavathi Perumal S <bperumal@codeaurora.org>, Miles Hu <milehu@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>, ath11k@lists.infradead.org, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Venkateswara Naralasetty <vnaralas@codeaurora.org>, Manikanta Pubbisetty <mpubbise@codeaurora.org>, Muna Sinada <msinada@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, Sathishkumar Muruganandam <murugana@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

+ ath11k

Colin Ian King <colin.king@canonical.com> writes:

> Hi,
>
> Static analysis with Coverity has detected an issue with the following
> commit:
>
> commit d5c65159f2895379e11ca13f62feabe93278985d
> Author: Kalle Valo <kvalo@codeaurora.org>
> Date:   Sat Nov 23 09:58:40 2019 +0200
>
>     ath11k: driver for Qualcomm IEEE 802.11ax devices
>
> The analysis is as follows:
>
> 4623 static struct sk_buff *
> 4624 ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
> 4625                            u32 mac_id, struct sk_buff *head_msdu,
> 4626                            struct sk_buff *last_msdu,
> 4627                            struct ieee80211_rx_status *rxs)
> 4628 {
> 4629        struct sk_buff *msdu, *mpdu_buf, *prev_buf;
> 4630        u32 decap_format, wifi_hdr_len;
> 4631        struct hal_rx_desc *rx_desc;
> 4632        char *hdr_desc;
> 4633        u8 *dest;
> 4634        struct ieee80211_hdr_3addr *wh;
> 4635
>
>     assignment: Assigning: mpdu_buf = NULL.
>
> 4636        mpdu_buf = NULL;
>
> 4718 err_merge_fail:
>      null: At condition mpdu_buf, the value of mpdu_buf must be NULL.
>      dead_error_condition: The condition mpdu_buf cannot be true.
>
> 'Constant' variable guards dead code (DEADCODE)
> dead_error_line: Execution cannot reach the expression decap_format !=
> DP_RX_DECAP_TYPE_RAW inside this statement: if (mpdu_buf && decap_forma....
>
>     Local variable mpdu_buf is assigned only once, to a constant value,
> making it effectively constant throughout its scope. If this is not the
> intent, examine the logic to see if there is a missing assignment that
> would make mpdu_buf not remain constant.
>
> 4719        if (mpdu_buf && decap_format != DP_RX_DECAP_TYPE_RAW) {
> 4720                ath11k_dbg(ar->ab, ATH11K_DBG_DATA,
> 4721                           "err_merge_fail mpdu_buf %pK", mpdu_buf);
> 4722                /* Free the head buffer */
> 4723                dev_kfree_skb_any(mpdu_buf);
> 4724        }
>
> Is this indended?

Yeah, this is suspicious and something is wrong in
ath11k_dp_rx_mon_merg_msdus(). Can someone take a look, please?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
