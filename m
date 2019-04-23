Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIw8G-0007Us-OJ
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 14:10:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/3] ath11k: Add some bug fixes and enhancements in htt
 stats
References: <1555343569-2072-1-git-send-email-bperumal@codeaurora.org>
Date: Tue, 23 Apr 2019 17:10:44 +0300
In-Reply-To: <1555343569-2072-1-git-send-email-bperumal@codeaurora.org>
 (Bhagavathi Perumal S.'s message of "Mon, 15 Apr 2019 21:22:46 +0530")
Message-ID: <875zr4zuaj.fsf@kamboji.qca.qualcomm.com>
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: ath11k@lists.infradead.org

Bhagavathi Perumal S <bperumal@codeaurora.org> writes:

> This fixes few coding bugs, And adds htt peer stats
> as a separate debugfs entry and htt stats reset.
>
> Bhagavathi Perumal S (3):
>   ath11k: Fix few coding bugs in htt stats
>   ath11k: Add htt peer stats support
>   ath11k: Add debugfs entry to support htt stats reset

Does not compile on x86_64 with GCC 8.1.0:

drivers/net/wireless/ath/ath11k/debugfs_sta.c:432:10: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct inode *, struct file *)' {aka 'long int (*)(struct inode *, struct file *)'} [-Werror=incompatible-pointer-types]

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
