Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ0JL-0000Gs-MK
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 18:38:32 +0000
MIME-Version: 1.0
Date: Wed, 24 Apr 2019 00:08:30 +0530
From: Bhagavathi Perumal S <bperumal@codeaurora.org>
Subject: Re: [PATCH 0/3] ath11k: Add some bug fixes and enhancements in htt
 stats
In-Reply-To: <875zr4zuaj.fsf@kamboji.qca.qualcomm.com>
References: <1555343569-2072-1-git-send-email-bperumal@codeaurora.org>
 <875zr4zuaj.fsf@kamboji.qca.qualcomm.com>
Message-ID: <9d4776387a3b319caf2ff48d6a1a46fc@codeaurora.org>
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

On 2019-04-23 19:40, Kalle Valo wrote:
> Bhagavathi Perumal S <bperumal@codeaurora.org> writes:
> 
>> This fixes few coding bugs, And adds htt peer stats
>> as a separate debugfs entry and htt stats reset.
>> 
>> Bhagavathi Perumal S (3):
>>   ath11k: Fix few coding bugs in htt stats
>>   ath11k: Add htt peer stats support
>>   ath11k: Add debugfs entry to support htt stats reset
> 
> Does not compile on x86_64 with GCC 8.1.0:
> 
> drivers/net/wireless/ath/ath11k/debugfs_sta.c:432:10: error:
> initialization of 'int (*)(struct inode *, struct file *)' from
> incompatible pointer type 'ssize_t (*)(struct inode *, struct file *)'
> {aka 'long int (*)(struct inode *, struct file *)'}
> [-Werror=incompatible-pointer-types]

Fixed and sent v2 patch.

Thanks,
Bhagavathi.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
