Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJCU9-0006Xa-Ju
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 07:38:31 +0000
MIME-Version: 1.0
Date: Wed, 24 Apr 2019 13:08:28 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH] ath11k: move per peer pktlog entry to per sta debugfs
In-Reply-To: <871s1szu4f.fsf@kamboji.qca.qualcomm.com>
References: <1555389673-19625-1-git-send-email-akolli@codeaurora.org>
 <871s1szu4f.fsf@kamboji.qca.qualcomm.com>
Message-ID: <3753b87a425d38b5c50c33cb4c030451@codeaurora.org>
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

Hi Kalle,

Thanks for the review.

>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> 
> Does not compile:
> 
> drivers/net/wireless/ath/ath11k/debugfs_sta.c:455:11: error:
> initialization of 'ssize_t (*)(struct file *, const char *, size_t,
> loff_t *)' {aka 'long int (*)(struct file *, const char *, long
> unsigned int,  long long int *)'} from incompatible pointer type
> 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int
> (*)(struct file *, char *, long unsigned int,  long long int *)'}
> [-Werror=incompatible-pointer-types]
>   .write = ath11k_dbg_sta_write_peer_pktlog,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I am using "arch/x86/configs/x86_64_defconfig" and ath11k enabled, could 
not reproduce this issue.
Kindly share the build instructions.

Thanks
Anil.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
