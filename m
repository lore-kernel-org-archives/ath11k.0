Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaDIZ-0007y3-Km
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 07:33:41 +0000
MIME-Version: 1.0
Date: Wed, 04 Nov 2020 15:32:21 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <CA+ASDXM7TcF-zfbktbdSu-fDBuGe0LAgFq3Qt2zaq6efbWJ=sA@mail.gmail.com>
References: <1600753017-4614-1-git-send-email-cjhuang@codeaurora.org>
 <CA+ASDXM7TcF-zfbktbdSu-fDBuGe0LAgFq3Qt2zaq6efbWJ=sA@mail.gmail.com>
Message-ID: <f3be456c4c748f21836279eb4dc16e5e@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org, Doug Anderson <dianders@chromium.org>

On 2020-11-04 10:00, Brian Norris wrote:
> On Mon, Sep 21, 2020 at 10:37 PM Carl Huang <cjhuang@codeaurora.org> 
> wrote:
>> +/**
>> + * struct cfg80211_sar_capa - sar limit capability
>> + * @type: it's set via power in 0.25dbm or other types
>> + * @num_freq_ranges: number of frequency ranges
>> + * @chan_ranges: memory to hold the channel ranges.
>> + */
>> +struct cfg80211_sar_capa {
>> +       enum nl80211_sar_type type;
>> +       u8 num_freq_ranges;
>> +       const struct cfg80211_sar_freq_ranges *freq_ranges;
>> +};
> ...
>>         u8 max_data_retry_count;
>> 
>> +       const struct cfg80211_sar_capa *sar_capa;
>> +
>>         char priv[] __aligned(NETDEV_ALIGN);
>>  };
> 
> What are the ABI guarantees around a given driver/chip's 'sar_capa'?
> Do we guarantee that if the driver supports N ranges of certain bands,
> that it will always continue to support those bands? What if, for
> instance, ath10k grows a new set of subbands, supporting sub-sections
> of the 5GHz band -- does it still need to support both a contiguous
> [5, 5 + X] and a split [5, 5 + X/2], [5 + X/2, 5 + X]? Basically, do
> we intend to put the burden on user space to figure out how to map its
> power tables to the supported frequency band(s), or on the kernel, to
> support a backwards-compatible set of frequency ranges? The latter
> doesn't really work if you expect user space to always specify all
> ranges in a SET command.
> 
> To be clear, I'm not as worried about differences between chips or
> drivers (I expect that different driver or chips may have different
> range support); just about stability for a given chip.
> 
For a given chip(at least a QCOM chip), we don't see that the
range will grow or change.

In addition, with current index-power SET method, it's hard for driver
to know what the index mean given your example. Does the index mean
[5,5 + x] or [5, 5 + x/2] ?  So it's required for user-space to specify
all the ranges.

The number of ranges is quite small, so the SET itself is not a
problem to specify all.

Brian, are you fine that we go with this proposal? I'll send
V2 based on the comments from Johannes and Abhishek.


> Brian

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
