Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khuke-0006Fh-Sp
 for ath11k@lists.infradead.org; Wed, 25 Nov 2020 13:22:30 +0000
Subject: Re: ath11k with QCA6391
References: <c9fb5fa6-297e-a595-7670-c9105641bc83@doubly.so>
 <87wnz3twvo.fsf@codeaurora.org>
 <5f3ee526-e96f-3c88-a17e-e7ebf9703ed1@doubly.so>
 <87d00uo85x.fsf@codeaurora.org>
From: Devin Bayer <dev@doubly.so>
Message-ID: <48f37c07-ca63-7ba9-1518-a31681777b15@doubly.so>
Date: Wed, 25 Nov 2020 14:22:19 +0100
MIME-Version: 1.0
In-Reply-To: <87d00uo85x.fsf@codeaurora.org>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 03/11/2020 14.56, Kalle Valo wrote:
> Devin Bayer <dev@doubly.so> writes:
> 
>> On 02/11/2020 19.51, Kalle Valo wrote:
>>>
>>> To my knowledge, from ath11k point of view, QCA6391 should look the same
>>> as QCA6390 but most likely the board file for QCA6391 is different.
>>>
>> [snip]
>>
>> They are different than those from your repo, but maybe I can use
>> bdwlan01.e04 as the board file.
> 
> Yes, that's what I would also suggest to test first: take the firmware
> from ath11k-firmware.git and the board file from the vendor.

I would like to report that with your latest qca6390-bringup branch my QCA6391
card is working well with just the one MSI vector. I'm using the board file for
6390 from the linux-firmware repo.

Thanks for the fixes :)

~ dev

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
