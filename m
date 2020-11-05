Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaakV-0003jd-Jb
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 08:36:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
References: <1600753017-4614-1-git-send-email-cjhuang@codeaurora.org>
 <CA+ASDXM7TcF-zfbktbdSu-fDBuGe0LAgFq3Qt2zaq6efbWJ=sA@mail.gmail.com>
 <f3be456c4c748f21836279eb4dc16e5e@codeaurora.org>
 <CA+ASDXNaLvtJyY9_ds9RVL9VTkiYzChsGJS1czhVt-RKitCk5g@mail.gmail.com>
Date: Thu, 05 Nov 2020 10:35:56 +0200
In-Reply-To: <CA+ASDXNaLvtJyY9_ds9RVL9VTkiYzChsGJS1czhVt-RKitCk5g@mail.gmail.com>
 (Brian Norris's message of "Wed, 4 Nov 2020 09:44:55 -0800")
Message-ID: <877dr0nqtv.fsf@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Carl Huang <cjhuang@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, ath11k@lists.infradead.org, Abhishek Kumar <kuabhs@google.com>

Brian Norris <briannorris@chromium.org> writes:

> + ath10k
>
> [ I realize I replied to the "wrong" RFC v1; I fell trap to Kalle's note:
>
> "When you submit a new version mark it as "v2". Otherwise people don't
> know what's the latest version." ]
>
> On Tue, Nov 3, 2020 at 11:32 PM Carl Huang <cjhuang@codeaurora.org> wrote:
>> On 2020-11-04 10:00, Brian Norris wrote:
>> > What are the ABI guarantees around a given driver/chip's 'sar_capa'?
>> > Do we guarantee that if the driver supports N ranges of certain bands,
>> > that it will always continue to support those bands?
> ...
>> For a given chip(at least a QCOM chip), we don't see that the
>> range will grow or change.
>
> That's good to know. But that's not quite the same as an ABI guarantee.

I'm not sure if I understood Brian's question correctly, but I have
concerns on the assumption that frequency ranges never change. For
example, in ath10k we have a patch[1] under discussion which adds more
channels and in ath11k we added 6 GHz band after initial ath11k support
landed. And I would not be surprised if in some boards/platforms a
certain band is disabled due to cotting costs (no antenna etc). My
preference is to have a robust interface which would be designed to
handle these kind of changes.

[1] [PATCH] ath10k: enable advertising support for channels 32, 68 and 98

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
