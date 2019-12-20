Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiCZc-0003Ty-3k
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 07:19:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Remove unnecessary enum scan_priority
References: <20191211192252.35024-1-natechancellor@gmail.com>
 <CAKwvOdmQp+Rjgh49kbTp1ocLCjv4SUACEO4+tX5vz4stX-pPpg@mail.gmail.com>
 <87a77o786o.fsf@kamboji.qca.qualcomm.com>
 <CAKwvOdk3EPurHLMf81VHowauRYZ4FZXxNg98hJvp8CLgu=SSPw@mail.gmail.com>
Date: Fri, 20 Dec 2019 09:19:30 +0200
In-Reply-To: <CAKwvOdk3EPurHLMf81VHowauRYZ4FZXxNg98hJvp8CLgu=SSPw@mail.gmail.com>
 (Nick Desaulniers's message of "Thu, 19 Dec 2019 09:06:37 -0800")
Message-ID: <877e2r4g71.fsf@kamboji.qca.qualcomm.com>
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
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <natechancellor@gmail.com>, ath11k@lists.infradead.org

Nick Desaulniers <ndesaulniers@google.com> writes:

> On Thu, Dec 19, 2019 at 5:32 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Nick Desaulniers <ndesaulniers@google.com> writes:
>>
>> > On Wed, Dec 11, 2019 at 11:23 AM Nathan Chancellor
>> > <natechancellor@gmail.com> wrote:
>> >> wmi_scan_priority and scan_priority have the same values but the wmi one
>> >> has WMI prefixed to the names. Since that enum is already being used,
>> >> get rid of scan_priority and switch its one use to wmi_scan_priority to
>> >> fix this warning.
>> >>
>> > Also, I don't know if the more concisely named enum is preferable?
>>
>> I didn't get this comment.
>
> Given two enums with the same values:
> enum scan_priority
> enum wmi_scan_priority
> wouldn't you prefer to type wmi_ a few times less?  Doesn't really
> matter, but that was the point I was making.

Ah, now I got it :) This enum is part of firmware interface (WMI) so
yes, I prefer to use the wmi_ prefix to make that obvious.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
