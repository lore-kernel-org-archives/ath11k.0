Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knU3Q-0002Yg-Rs
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 22:04:53 +0000
Received: by mail-pg1-x542.google.com with SMTP id f17so5549933pge.6
 for <ath11k@lists.infradead.org>; Thu, 10 Dec 2020 14:04:50 -0800 (PST)
Subject: Re: [PATCH 5/6] ath11k: pci: disable VDD4BLOW
References: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
 <1607609124-17250-6-git-send-email-kvalo@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <d9b860d3-4ccc-f16c-9b0c-e0e7a0646e64@eero.com>
Date: Thu, 10 Dec 2020 14:04:43 -0800
MIME-Version: 1.0
In-Reply-To: <1607609124-17250-6-git-send-email-kvalo@codeaurora.org>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


On 12/10/20 6:05 AM, Kalle Valo wrote:
> From: Carl Huang <cjhuang@codeaurora.org>
>
> It's recommended to disable VDD4BLOW during initialisation.

Can you explain more about "recommended by whom and why"?


Thanks,

Peter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
