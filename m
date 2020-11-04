Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka868-00035S-Kh
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 02:00:29 +0000
Received: by mail-lj1-x22b.google.com with SMTP id o13so12922632ljj.11
 for <ath11k@lists.infradead.org>; Tue, 03 Nov 2020 18:00:24 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id 70sm155975lfe.123.2020.11.03.18.00.21
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 18:00:22 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 141so25003746lfn.5
 for <ath11k@lists.infradead.org>; Tue, 03 Nov 2020 18:00:21 -0800 (PST)
MIME-Version: 1.0
References: <1600753017-4614-1-git-send-email-cjhuang@codeaurora.org>
In-Reply-To: <1600753017-4614-1-git-send-email-cjhuang@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 3 Nov 2020 18:00:07 -0800
Message-ID: <CA+ASDXM7TcF-zfbktbdSu-fDBuGe0LAgFq3Qt2zaq6efbWJ=sA@mail.gmail.com>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org, Doug Anderson <dianders@chromium.org>

On Mon, Sep 21, 2020 at 10:37 PM Carl Huang <cjhuang@codeaurora.org> wrote:
> +/**
> + * struct cfg80211_sar_capa - sar limit capability
> + * @type: it's set via power in 0.25dbm or other types
> + * @num_freq_ranges: number of frequency ranges
> + * @chan_ranges: memory to hold the channel ranges.
> + */
> +struct cfg80211_sar_capa {
> +       enum nl80211_sar_type type;
> +       u8 num_freq_ranges;
> +       const struct cfg80211_sar_freq_ranges *freq_ranges;
> +};
...
>         u8 max_data_retry_count;
>
> +       const struct cfg80211_sar_capa *sar_capa;
> +
>         char priv[] __aligned(NETDEV_ALIGN);
>  };

What are the ABI guarantees around a given driver/chip's 'sar_capa'?
Do we guarantee that if the driver supports N ranges of certain bands,
that it will always continue to support those bands? What if, for
instance, ath10k grows a new set of subbands, supporting sub-sections
of the 5GHz band -- does it still need to support both a contiguous
[5, 5 + X] and a split [5, 5 + X/2], [5 + X/2, 5 + X]? Basically, do
we intend to put the burden on user space to figure out how to map its
power tables to the supported frequency band(s), or on the kernel, to
support a backwards-compatible set of frequency ranges? The latter
doesn't really work if you expect user space to always specify all
ranges in a SET command.

To be clear, I'm not as worried about differences between chips or
drivers (I expect that different driver or chips may have different
range support); just about stability for a given chip.

Brian

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
