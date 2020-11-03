Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwoW-000140-4e
 for ath11k@lists.infradead.org; Tue, 03 Nov 2020 13:57:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k with QCA6391
References: <c9fb5fa6-297e-a595-7670-c9105641bc83@doubly.so>
 <87wnz3twvo.fsf@codeaurora.org>
 <5f3ee526-e96f-3c88-a17e-e7ebf9703ed1@doubly.so>
Date: Tue, 03 Nov 2020 15:56:58 +0200
In-Reply-To: <5f3ee526-e96f-3c88-a17e-e7ebf9703ed1@doubly.so> (Devin Bayer's
 message of "Tue, 3 Nov 2020 11:53:55 +0100")
Message-ID: <87d00uo85x.fsf@codeaurora.org>
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

> On 02/11/2020 19.51, Kalle Valo wrote:
>> 
>> To my knowledge, from ath11k point of view, QCA6391 should look the same
>> as QCA6390 but most likely the board file for QCA6391 is different.
>> 
>
> Thanks. If I get to that point, I have been given firmware files from the
> vendor:
>
> 4076546464 3602624 amss.bin
> 1400223385 57936 bdwlan.bin
> 1400223385 57936 bdwlan.e0102
> 1400223385 57936 bdwlan.e0104
> 1400223385 57936 bdwlan.elf
>  691636418 57936 bdwlan01.e01
> 1400223385 57936 bdwlan01.e02
>  691636418 57936 bdwlan01.e03
> 3117335203 57936 bdwlan01.e04
> 1014175487 266684 m3.bin
>
> They are different than those from your repo, but maybe I can use
> bdwlan01.e04 as the board file.

Yes, that's what I would also suggest to test first: take the firmware
from ath11k-firmware.git and the board file from the vendor.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
