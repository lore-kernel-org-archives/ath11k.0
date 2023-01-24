Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E22C25B4E
	for <ath11k@archiver.kernel.org>; Tue, 24 Jan 2023 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KO7Dacag+EP8LRbPdhEuksr6v0sz/YrQ5iWN4hc5raY=; b=NZOA28FBkH1O0i
	5YqicPkUBPgleBNUsJixgRtF8t8E+AKqHKDehDLMJRpVXvGDxMsFzy2/ZEjSKe3ngwtKEq0r3aVWT
	fG9vUHFervSHoDjxl0ph7dJH9Ax1We7iAUSR3418cZV3CisMiIz6mDOIeNvUO4qNKql3K9hJlkHRM
	IuOVmFqvmF/Z5MkOCGDcqqltMT3g3tQF5FD0WnTXPHBWYxm/sjr+dxTlCnfaTtEQCOPVWz8BFdtTH
	FV7VxG60OlSwZd+LVAihWkkkCN3A5xVdw1+2nIrw34V1zoeCDUkn20B8Kf9SemJbTJYuayTskbmgd
	r7c9t27bQEpiM8hpS17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHGG-003NqQ-8F; Tue, 24 Jan 2023 11:14:44 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHGD-003Nne-Ty
	for ath11k@lists.infradead.org; Tue, 24 Jan 2023 11:14:43 +0000
Received: from [192.168.0.203] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M9WeC-1pNYVv2ErM-005dS7; Tue, 24 Jan 2023 12:14:23 +0100
Message-ID: <eac1cf31-518f-6542-24c6-69e6c059f3c9@green-communications.fr>
Date: Tue, 24 Jan 2023 12:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
 <20221226083328.29051-2-quic_ramess@quicinc.com>
 <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
 <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
 <Y8q5Z98S3pODD77W@lore-desk>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <Y8q5Z98S3pODD77W@lore-desk>
X-Provags-ID: V03:K1:oE3dX4RdequYSrBHTUbDn30PfJAs+olUvBaNQZ0dN2uEXLP//tu
 tkp8/zSD/XZhXxetf421bXRlpg9cl92kzLzulLF7lCOLwAig62HxYMsGZmIAyPlSByuSWev
 ABxd8wqTWmvwMxSnrhi565vsSKiIUZVxGSkF2VyV7g6g5InrQ91oOFUqIvjBVYO4Fz158Z6
 h5YSEquMPhpgVv+znkIRw==
UI-OutboundReport: notjunk:1;M01:P0:Vl/qQ6SuslU=;L2McOHb4hLMTam33CIGM5BLgfSr
 Wnu/ttorfviXOSTwzlqhtPAzq1gmDTR22roMpUBRN8ti33AJ/GNCqT2OV8P1pyV/vGuk7k7/c
 4dqKFrNAyZEYmz0dBBgOPjeCQA4LAgrPfFikxm4DLJmPQHaRCMTVqteMX/fcLLsSpwRmTjH6S
 z7zgzyetUvszYhImD+5MvzXrfY2QlKeCySRUl85yR/GKkBQ5VdroZPpSBcAd+GyfpK6TxIXHE
 xIV0Xkm4NOzMnbo8vRMG5D/+64Q4T3rdqmOcm0ka0EwSe7X1i6VEaYrKWLVTha3c7BJ1F49o2
 V6tQPFzyBpi2KnXeHWANw9jRgIL6FoxQuvqQ4r/0zP5sqa8j4fjLIrjLXlVp3rY0sPGK+v1Na
 AhXCiT/b9vRgz3/1comQkOyQQJ/0PMOVwxfy+epeq/3P7zcuvOvJkoywbqS3esAOI0DtYtfA0
 BW3NVG3/bgNzmxFrhATF78vr/AnsLSFML2FpxTUYC+yW78rlOCPLe3tG5QQJZza7dISgCvoFw
 n2A8XMvN+bGpE+WcknD/6JSBdS63AO8FU8jG0FHIpGV3vqNf1oNtdc34BreOkYFZSgr8yIf6V
 K76pvHQ5+pjQqrrkVBBQPZVdKMBKNOBTk3h80aEJjtlXLhiZq0v9rZsX43FdTzMMo3QBIjiiw
 t6jE4Qwlvtv86Zq29NZlVVtUOukDNjZNgozRDkOnGw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_031442_299751_B27D5A45 
X-CRM114-Status: GOOD (  13.17  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Lorenzo,

On 20/01/2023 16:55, Lorenzo Bianconi wrote:
> I agree, I think we can ratelimit netlink messages sent by the kernel to
> userspace (e.g. to hostapd), I would say every 500ms is ok.
> I guess we can move cfg80211_obss_color_collision_notify() in a dedicated
> delayed_work so we can grab wdev mutex (cfg80211_obss_color_collision_notify is
> currently running in interrupt context).
> To give an idea, what do you think about patch below? (please note it is just
> compiled tested so far).

The patch does not work, the fix appears easy:
> +void ieee80211_color_collision_detection_work(struct work_struct *work)
> +{
> +	struct delayed_work *delayed_work = to_delayed_work(work);
> +	struct ieee80211_link_data *link =
> +		container_of(delayed_work, struct ieee80211_link_data,
> +			     dfs_cac_timer_work);

This should probably be color_collision_detect_work.

> +	struct ieee80211_sub_if_data *sdata = link->sdata;
> +
> +	sdata_lock(sdata);

It crashed here, link is NULL.

> +	cfg80211_obss_color_collision_notify(sdata->dev, link->color_bitmap,
> +					     GFP_KERNEL);
> +	sdata_unlock(sdata);
> +}
Will test the fixed version later.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
