Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjjek-0008Ff-6p
 for ath11k@lists.infradead.org; Mon, 30 Nov 2020 13:55:55 +0000
MIME-Version: 1.0
Date: Mon, 30 Nov 2020 19:25:21 +0530
From: akolli@codeaurora.org
Subject: Re: [PATCH v2] ath11k: fix rmmod failure if qmi sequence fails
In-Reply-To: <87mtz5pm8a.fsf@codeaurora.org>
References: <1605076699-21924-1-git-send-email-akolli@codeaurora.org>
 <87mtz5pm8a.fsf@codeaurora.org>
Message-ID: <013d9ee1c0f88863013f2672b6b2197a@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-11-25 19:33, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
>> QMI sequence fails if caldata file is not available.
>> It is observed that 'rmmod ath11k' fails if qmi message fails.
>> With this patch rmmod/insmod is working.
>> 
>> Logs:
>> Direct firmware load for IPQ8074/caldata.bin failed with error -2
>> Falling back to user helper
>> qmi failed to load CAL: IPQ8074/caldata.bin
>> qmi failed to load board data file:-11
>> 
>> Tested-on: IPQ8074 hw2.0 AHB 
>> WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> 
> With this patch reloading ath11k (which has worked fine before) crashes
> the kernel on QCA6390 hw2.0:
> 
> Nov 25 16:00:52 nuc1 [  393.188277] BUG: unable to handle page fault
> for address: ffffffffc05b8e38
> Nov 25 16:00:52 nuc1 [  393.188300] #PF: supervisor read access in 
> kernel mode
> Nov 25 16:00:52 nuc1 [  393.188312] #PF: error_code(0x0000) - 
> not-present page

I will test this in QCA6390 and update.
Which branch should I use for testing. master or ath11k-qca6390-bringup 
?

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
