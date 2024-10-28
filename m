Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60887D339A9
	for <ath11k@archiver.kernel.org>; Mon, 28 Oct 2024 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlfdtHMVwDWpdlVbYkGk/zHZ1chnfh2I7xrrHmqirXA=; b=BQI4bFH5DQxVIQ9c8CknjB90o6
	CsTdvqmvclUZtOiVdw0ZMbrNHLXumoxeBHTg8OERE4fkeJUXv0ZRlJZLAXQ7f7E13r8JvcnxHmor3
	Xwuyi1VBa5uehR49ThCeJ7SgMSpsqiTKR+eHRQrlgVXHo382mlboZXWCvNd5Px8sRjI1S54s4wrNo
	m5E90OXM1iRuGdhUpc9MwifqvAYKv2WJsHa9yqXuSaCK4sxj8RFvAx2jVto8LDF3tf2Sm4WuqvmWA
	K/hUWTigdtFNakDxUQmYE1ALCaaWQx6OBgk/khAcyB6Tcc44ItSZptZn1c28AFc4L2X1fS1YJS5z4
	W1Ii6RkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tfx-0000000Bfl2-3Z7Y;
	Mon, 28 Oct 2024 17:37:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tfu-0000000BfkI-23d3
	for ath11k@lists.infradead.org;
	Mon, 28 Oct 2024 17:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C876F5C5B9E;
	Mon, 28 Oct 2024 17:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9CDC4CEC3;
	Mon, 28 Oct 2024 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730137025;
	bh=WhZ8MSqqpL1fOhdN4WCI07mV5UW8J/yJa87MLuIn3Io=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=MxYUvxaWCbgBkGN1MONGgBW9Wpe0Jrjby99QI9X5m38naKgrxGFAgwDiRNRnMVZa1
	 AAaDP1H2oEh2517Q4YPYVLxOicTGgyDRC7RihzPLY2+AL/E7atiJtlZOwR33KBIZqK
	 VsPiLxtEZsskDEapH0MMRF+tkuaC3U7TjpR8eS+GQRU8hRPSnYWnf0w4oGZ74HfxLl
	 1WzWYtPNWzCTypMgJhna+0sW/S8UJTUbsNNbROCDriPh5fOQVVmoUC0nY9+ZdkfxMa
	 AJsURge5mH1nLp32ARHj2iPOSmY/esDVpGfc0QgYGzISIX52IbZ2DLgA0FjSBUGg+U
	 1ynLq3bauAp7Q==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Jeff Johnson
 <jjohnson@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Konrad
 Dybcio <konradybcio@kernel.org>,  linux-firmware@kernel.org,
  ath11k@lists.infradead.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific
 subdir
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
	<379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com>
	<87plntnwon.fsf@kernel.org>
	<CAA8EJppAiktoPk9hZnDdj5igZ9-D0229WRfwg08y8CPnwerx-g@mail.gmail.com>
Date: Mon, 28 Oct 2024 19:37:01 +0200
In-Reply-To: <CAA8EJppAiktoPk9hZnDdj5igZ9-D0229WRfwg08y8CPnwerx-g@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 21 Oct 2024 21:34:27 +0300")
Message-ID: <87iktcgmde.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_103706_638510_FC307D69 
X-CRM114-Status: GOOD (  21.69  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Mon, 21 Oct 2024 at 21:22, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>
>> >> Dmitry Baryshkov (1):
>> >>       ath11k: move WCN6750 firmware to the device-specific subdir
>> >>
>> >>  WHENCE                                             |  12 ++----------
>> >>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
>> >>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
>> >>  11 files changed, 2 insertions(+), 10 deletions(-)
>> >>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
>>
>> So this follow basically the same directory hierarchy as you Dmitry
>> implemented for ath10k in commit 5abf259772df ("wifi: ath10k: support
>> board-specific firmware overrides"), right? Just making sure we are on
>> the same page. I think ath10k/ath11k/ath12k drivers should follow the
>> same design as much as possible.
>
> Yes, that was my goal. Having subdirs under the main dir.

Very good.

>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
>> >
>> > I'm waiting for Kalle to respond, but at a minimum I suspect our internal
>> > firmware tooling would be impacted by this change.
>>
>> Yeah, most likely we need to update our tools. But we would have to do
>> it anyway so I'm not concerned about that.
>
> Ok. If there are no concerns from your side, could you possibly
> respond with Acked-by? Then we can unblock and merge this.

Sure:

Acked-by: Kalle Valo <kvalo@kernel.org>

>> > Kalle, do you have concerns or suggestions on how to handle this issue?
>>
>> Looks good to me.
>>
>> Dmitry, if you have the time please take a look at this:
>>
>> https://patchwork.kernel.org/project/linux-wireless/cover/20241001033053.2084360-1-quic_miaoqing@quicinc.com/
>>
>> Based on a quick look it seems to do things differently and not really a
>> fan of that.
>
> Yes, I'd prefer a subdir rather than this implementation. I'll respond
> either today or tomorrow.

Thanks a lot, I appreciate you helping us.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

