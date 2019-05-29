Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0YD-0001Wz-9t
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:31:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V6 10/11] ath11k: properly convert bw
References: <20190528064803.24419-1-john@phrozen.org>
 <20190528064803.24419-11-john@phrozen.org>
Date: Wed, 29 May 2019 18:31:33 +0300
In-Reply-To: <20190528064803.24419-11-john@phrozen.org> (John Crispin's
 message of "Tue, 28 May 2019 08:48:02 +0200")
Message-ID: <87woi91dm2.fsf@kamboji.qca.qualcomm.com>
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> The bandwidth inside the TX reporting code is not properly converted from
> ath11k values to the rate_info ones.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

Already applied so dropping.

d9a34e89f148 ath11k: properly convert bw

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
