Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AlE-0005W6-72
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 20:29:45 +0000
Message-ID: <c60afe716cc9ce3b511d8be0b04958342dfea908.camel@sipsolutions.net>
Subject: Re: [PATCH 46/49] ath11k: add wmi.h
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 20 Aug 2019 22:29:41 +0200
In-Reply-To: <1566316095-27507-47-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_181541_270184_9285B240)
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-47-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_181541_270184_9285B240)
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
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

On Tue, 2019-08-20 at 18:48 +0300, Kalle Valo wrote:
> 
> +enum wmi_cmd_group {
> +	/* 0 to 2 are reserved */
> +	WMI_GRP_START = 0x3,
> +	WMI_GRP_SCAN = WMI_GRP_START, /* 0x3 */
> +	WMI_GRP_PDEV,           /* 0x4 */

If you're going to spell out the numbers anyway, why not do it in C
rather than a comment?

	WMI_GRP_PDEV		= 0x4,

would tell you just as much, and be much less error-prone.

> +struct wmi_pdev_set_hw_mode_cmd_param {
> +	u32 tlv_header;
> +	u32 pdev_id;
> +	u32 hw_mode_index;
> +	u32 num_band_to_mac;
> +} __packed;

Does it really makes sense for something to be using "u32" (i.e. host
endian) but then __packed (kinda tagging it as "I am using this with the
hardware, don't change the layout")?

That really applies to a lot of the things here.

> +struct channel_param {
> +	u8 chan_id;
> +	u8 pwr;
> +	u32 mhz;
> +	u32 half_rate:1,
> +	    quarter_rate:1,
> +	    dfs_set:1,
> +	    dfs_set_cfreq2:1,
> +	    is_chan_passive:1,
> +	    allow_ht:1,
> +	    allow_vht:1,
> +	    set_agile:1;
> +	u32 phy_mode;
> +	u32 cfreq1;
> +	u32 cfreq2;
> +	char   maxpower;
> +	char   minpower;
> +	char   maxregpower;
> +	u8  antennamax;
> +	u8  reg_class_id;
> +} __packed;

Bitfields in FW structs are even less likely to work right, I'd avoid
that.

(and if you have this copy engine do endian conversion, then the u8
fields won't work right since that ending seems to be working on u32s?)

That probably all applies elsewhere too, but the file is pretty long ;-)

Personally, I'd also consider splitting internal driver usage stuff and
FW API into different files, but that's your decision. I just find it
lets me understand it better even when I'm looking at it myself.

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
