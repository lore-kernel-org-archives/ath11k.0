Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihvuS-0007l5-R2
 for ath11k@lists.infradead.org; Thu, 19 Dec 2019 13:32:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Remove unnecessary enum scan_priority
References: <20191211192252.35024-1-natechancellor@gmail.com>
 <CAKwvOdmQp+Rjgh49kbTp1ocLCjv4SUACEO4+tX5vz4stX-pPpg@mail.gmail.com>
Date: Thu, 19 Dec 2019 15:31:59 +0200
In-Reply-To: <CAKwvOdmQp+Rjgh49kbTp1ocLCjv4SUACEO4+tX5vz4stX-pPpg@mail.gmail.com>
 (Nick Desaulniers's message of "Thu, 12 Dec 2019 11:34:42 -0800")
Message-ID: <87a77o786o.fsf@kamboji.qca.qualcomm.com>
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

> On Wed, Dec 11, 2019 at 11:23 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
>>
>> Clang warns:
>>
>> drivers/net/wireless/ath/ath11k/wmi.c:1827:23: warning: implicit
>> conversion from enumeration type 'enum wmi_scan_priority' to different
>> enumeration type 'enum scan_priority' [-Wenum-conversion]
>>         arg->scan_priority = WMI_SCAN_PRIORITY_LOW;
>>                            ~ ^~~~~~~~~~~~~~~~~~~~~
>> 1 warning generated.
>>
>> wmi_scan_priority and scan_priority have the same values but the wmi one
>> has WMI prefixed to the names. Since that enum is already being used,
>> get rid of scan_priority and switch its one use to wmi_scan_priority to
>> fix this warning.
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Link: https://github.com/ClangBuiltLinux/linux/issues/808
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Further, it looks like the member `scan_priority` in `struct
> wmi_start_scan_arg` and `struct wmi_start_scan_cmd` should probably
> use `enum wmi_scan_priority`, rather than `u32`.

struct wmi_start_scan_cmd is sent to firmware and that's why it has u32
to make sure that the size is exactly 32 bits.

> Also, I don't know if the more concisely named enum is preferable?

I didn't get this comment.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
