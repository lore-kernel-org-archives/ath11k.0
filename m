Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C60C64ED8
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIfmtd8AOaeafLn59qK65sF3hTWUS6k0QJfC5ge8iFg=; b=2Xl6ixlEWe0zDI
	GpWTHte6i2uNnB2xpT5FuqiE70eTXN15JFJGxUml7rVWFhgKw+E8nlLjz91FWEE959YHD/WplEU1s
	45r03a8oQs9+3BqkhXwWIbBGn+4KZf+uPijlFcLv6v0ybrBZWUZVYz6Wu5UFp9DGsdcQex/LvIGq6
	QhdsZ3Xh+9zkYR3ds0Y42YYn0028+LRIbg/zr9oTnjp+3+FSh0vU9yscrJngzL66y04qgQ2oD0Qbq
	D0/XGSp9DuYWh/+AVLe9d/agEws+wokF8nHm/g9ww0VePnbHBzMnrYu+dnjiMZZHTL9/LJy03DGhz
	alEsQiE/TW78ScPAzRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdLR-009iFU-2J; Mon, 27 Feb 2023 13:15:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdLO-009iEt-3C
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 13:15:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C2E8B80D28;
	Mon, 27 Feb 2023 13:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB44C4339C;
	Mon, 27 Feb 2023 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677503703;
	bh=zJRZGvJSsndRbdRqpKpyfMIAZ4V2sTYXfUa93Tykhj4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bSi2lpcJ71zaE9649OxRBNTnQaX1CzXQDWmUHZDMgwdnp9C1GvX4qAq7BFW0ZpPlj
	 USAuOQOPfmroixGBl7nN1jRTTuSRr/bZxLKkDYVWL3veybabZj4jVBcyvMFxd02pm9
	 jf2Sxz+KX9dxIAlG0TW1aFg0ysW/sCHQW6VlkOR3E2ZHaBZtw3saYuSaSs7ybqubQu
	 MCdA1HcD0vBqdCWfLi8zurMhV7g0jC5PQ0g3smMLkCXjb8rhtn34X9LA7igGV8Wphy
	 AIZHAEu4nQC3ZBYTGhBmQlpbmVK+BEvmJZQNMNHfU+lqa5ynStrQ8dDTCnSX1CqVvb
	 rczQBMr5mUiZA==
From: Kalle Valo <kvalo@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: Add a warning for wcn6855 spurious wakeup events
References: <20230220213807.28523-1-mario.limonciello@amd.com>
	<87r0ubqo81.fsf@kernel.org>
	<980959ea-b72f-4cc0-7662-4dd64932d005@amd.com>
Date: Mon, 27 Feb 2023 15:14:54 +0200
In-Reply-To: <980959ea-b72f-4cc0-7662-4dd64932d005@amd.com> (Mario
	Limonciello's message of "Mon, 27 Feb 2023 07:07:21 -0600")
Message-ID: <87mt4zqmgh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_051506_453319_2AE624EB 
X-CRM114-Status: GOOD (  21.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Mario Limonciello <mario.limonciello@amd.com> writes:

> On 2/27/23 06:36, Kalle Valo wrote:
>
>> Mario Limonciello <mario.limonciello@amd.com> writes:
>>
>>> When WCN6855 firmware versions less than 0x110B196E are used with
>>> an AMD APU and the user puts the system into s2idle spurious wakeup
>>> events can occur. These are difficult to attribute to the WLAN F/W
>>> so add a warning to the kernel driver to give users a hint where
>>> to look.
>>>
>>> This was tested on WCN6855 and a Lenovo Z13 with the following
>>> firmware versions:
>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>>>
>>> Link: http://lists.infradead.org/pipermail/ath11k/2023-February/004024.html
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2377
>>> Link: https://bugs.launchpad.net/ubuntu/+source/linux-firmware/+bug/2006458
>>> Link:
>>> https://lore.kernel.org/linux-gpio/20221012221028.4817-1-mario.limonciello@amd.com/
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> [...]
>>
>>> +static void ath11k_check_s2idle_bug(struct ath11k_base *ab)
>>> +{
>>> +	struct pci_dev *rdev;
>>> +
>>> +	if (pm_suspend_target_state != PM_SUSPEND_TO_IDLE)
>>> +		return;
>>> +
>>> +	if (ab->id.device != WCN6855_DEVICE_ID)
>>> +		return;
>>> +
>>> +	if (ab->qmi.target.fw_version >= WCN6855_S2IDLE_VER)
>>> +		return;
>>> +
>>> +	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>>> +	if (rdev->vendor == PCI_VENDOR_ID_AMD)
>>> + ath11k_warn(ab, "fw_version 0x%x may cause spurious wakeups.
>>> Upgrade to 0x%x or later.",
>>> +			    ab->qmi.target.fw_version, WCN6855_S2IDLE_VER);
>>
>> I understand the reasons for this warning but I don't really trust the
>> check 'ab->qmi.target.fw_version >= WCN6855_S2IDLE_VER'. I don't know
>> how the firmware team populates the fw_version so I'm worried that if we
>> ever switch to a different firmware branch (or similar) this warning
>> might all of sudden start triggering for the users.
>>
>
> In that case, maybe would it be better to just have a list of the
> public firmware with issue and ensure it doesn't match one of those?

You mean ath11k checking for known broken versions and reporting that?
We have so many different firmwares to support in ath11k, I'm not really
keen on adding tests for a specific version.

We have a list of known important bugs in the wiki:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k#known_bugslimitations

What about adding the issue there, would that get more exposure to the
bug and hopefully the users would upgrade the firmware?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
