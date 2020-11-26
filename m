Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiE94-0000VT-Cl
 for ath11k@lists.infradead.org; Thu, 26 Nov 2020 10:04:59 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k with QCA6391
References: <c9fb5fa6-297e-a595-7670-c9105641bc83@doubly.so>
 <87wnz3twvo.fsf@codeaurora.org>
 <5f3ee526-e96f-3c88-a17e-e7ebf9703ed1@doubly.so>
 <87d00uo85x.fsf@codeaurora.org>
 <48f37c07-ca63-7ba9-1518-a31681777b15@doubly.so>
Date: Thu, 26 Nov 2020 12:04:45 +0200
In-Reply-To: <48f37c07-ca63-7ba9-1518-a31681777b15@doubly.so> (Devin Bayer's
 message of "Wed, 25 Nov 2020 14:22:19 +0100")
Message-ID: <87a6v4ph6q.fsf@codeaurora.org>
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
To: Devin Bayer <dev@doubly.so>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Devin Bayer <dev@doubly.so> writes:

> On 03/11/2020 14.56, Kalle Valo wrote:
>> Devin Bayer <dev@doubly.so> writes:
>> 
>>> On 02/11/2020 19.51, Kalle Valo wrote:
>>>>
>>>> To my knowledge, from ath11k point of view, QCA6391 should look the same
>>>> as QCA6390 but most likely the board file for QCA6391 is different.
>>>>
>>> [snip]
>>>
>>> They are different than those from your repo, but maybe I can use
>>> bdwlan01.e04 as the board file.
>> 
>> Yes, that's what I would also suggest to test first: take the firmware
>> from ath11k-firmware.git and the board file from the vendor.
>
> I would like to report that with your latest qca6390-bringup branch my QCA6391
> card is working well with just the one MSI vector. I'm using the board file for
> 6390 from the linux-firmware repo.
>
> Thanks for the fixes :)

Great, thanks for the report. It's always helpful to know what is
working or not working on the field.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
