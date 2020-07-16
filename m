Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvyg2-00011J-90
 for ath11k@lists.infradead.org; Thu, 16 Jul 2020 07:51:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RESEND 1/2] ath11k: add WMI calls to manually
 add/del/pause/resume
References: <20200624080321.2271943-1-john@phrozen.org>
Date: Thu, 16 Jul 2020 10:50:41 +0300
In-Reply-To: <20200624080321.2271943-1-john@phrozen.org> (John Crispin's
 message of "Wed, 24 Jun 2020 10:03:20 +0200")
Message-ID: <87pn8vx5im.fsf@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

+ linux-wireless

John Crispin <john@phrozen.org> writes:

> These calls are used for debugging and will be required for WFA
> certification tests.
>
> Signed-off-by: John Crispin <john@phrozen.org>

[...]

> +static void ath11k_wmi_twt_add_dialog_event(struct ath11k_base *ab, struct sk_buff *skb)
> +{
> +	static const char * const status[] = {
> +		"OK", "TWT_NOT_ENABLED", "USED_DIALOG_ID", "INVALID_PARAM",
> +		"NOT_READY", "NO_RESOURCE", "NO_ACK", "NO_RESPONSE",
> +		"DENIED", "UNKNOWN_ERROR"
> +	};
> +	const void **tb;
> +	const struct wmi_twt_add_dialog_event *ev;
> +	int ret;
> +
> +	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
> +	if (IS_ERR(tb)) {
> +		ret = PTR_ERR(tb);
> +		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
> +		return;
> +	}
> +
> +	ev = tb[WMI_TAG_TWT_ADD_DIALOG_COMPLETE_EVENT];
> +	if (!ev) {
> +		ath11k_warn(ab, "failed to fetch twt add dialog ev");
> +		goto exit;
> +	}
> +
> +	ath11k_info(ab, "TWT Add Dialog Event - Status: %s, DialogId: %d, VdevId: %d\n",
> +		    status[ev->status], ev->vdev_id, ev->dialog_id);

Shouldn't this be a debug message? The info level should be used very
sparingly.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
