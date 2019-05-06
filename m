Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNd2g-0006Mi-O4
 for ath11k@lists.infradead.org; Mon, 06 May 2019 12:48:27 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11K: add extended capabilities registration code
References: <20190426130031.14453-1-john@phrozen.org>
Date: Mon, 06 May 2019 15:48:19 +0300
In-Reply-To: <20190426130031.14453-1-john@phrozen.org> (John Crispin's message
 of "Fri, 26 Apr 2019 15:00:31 +0200")
Message-ID: <877eb3kauk.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath11k@lists.infradead.org, Srini Kode <skode@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> writes:

> This patch registers the ext capabilities fields with the subsystem.
> This allows us to announce TWT support.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

Failed to apply and sha1 information was useless so I couldn't use 3-way
merge. Please rebase, and preferably use ath11k-bringup branch as the
baseline so that I can use 3-way merge in the future.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
