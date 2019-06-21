Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heAha-0003d5-9y
 for ath11k@lists.infradead.org; Fri, 21 Jun 2019 03:59:03 +0000
MIME-Version: 1.0
Date: Fri, 21 Jun 2019 09:29:01 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH V2 1/4] ath11k: Clean up void *per_transfer_context[] in ce
In-Reply-To: <871rzo490f.fsf@kamboji.qca.qualcomm.com>
References: <1561022229-854-1-git-send-email-vthiagar@codeaurora.org>
 <20190620143658.5E811602BC@smtp.codeaurora.org>
 <871rzo490f.fsf@kamboji.qca.qualcomm.com>
Message-ID: <786f63abc9cc267673eb58467752e582@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

On 2019-06-20 20:08, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
>> Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:
>> 
>>> Since per_transfer_context is used as an array of skb pointer always
>>> no need that to be an array of void *.
>>> 
>>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>> 
>> 4 patches applied to ath11k-bringup branch of ath.git, thanks.
>> 
>> ac429efcdf8d ath11k: Clean up void *per_transfer_context[] in ce
>> 4fd9eee9c2ef ath11k: Add peer.[ch] files for peer related util 
>> functions
>> 9dff37f3c969 ath11k{dp, hal}: Endian macro related clean ups
>> 74971a410d44 ath11k/dp_rx: Clean up void *rx_desc in struct 
>> ath11k_skb_rxcb
> 
> There were few conflicts. Very easy to resolve with 3-way merge but
> please check anyway.

Looks good, thanks.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
