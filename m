Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D7ECAAD5
	for <ath11k@archiver.kernel.org>; Thu,  8 Sep 2022 06:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdONyVj7D6p/ePTCGbTHWFzjTfQIwxHxudozsrwvfdo=; b=W73kLkapWGo5wf
	BmzI9odiO6r9v2DFp29YwpJOFtBlbngi5ozBXgp19XLO5A3ciTt2zOC0RWsY9nZYDTo03a5p4aMAe
	ckUDo9/0ax9YJ9OFcv4TnrB3IW6QknrigbYkPRGPf3xKX2MvADuT6XLHnkhmxXMGhxNAhDuAEm+ff
	XPuYxMmXSptwYVmwLDrKU97eThSm6gRGMH0GQFJ0SdY8muBZbEueFDfu7tnejg6eLnBlnsI7RmicY
	i2yyq57A8Omd5Bm0K9z6cMsaaP3lPP8S0geKoAwb+I2gM7DMynPqacDQpObvDjO6CG3ckkmfvJElw
	9nO7Po+pZvJrWBw9zEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJW-00HXEG-TI; Thu, 08 Sep 2022 06:47:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJU-00HXCn-D8
	for ath11k@lists.infradead.org; Thu, 08 Sep 2022 06:47:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE5D1B81FCC;
	Thu,  8 Sep 2022 06:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4BFC433D6;
	Thu,  8 Sep 2022 06:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662619617;
	bh=AnEniN/1ezMQjDLZ/D6h3XTQ3sZZuGBFe25f8AVvwEU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=b8J8yFoY+GUQV2zu8knwJaeJtmPd8TE1uHZSH3ofxE5BmKp9kU/QfOkf2fzu1HfH5
	 /nRxKYFXqduzfgrGlns/DHiQpsMVk0llqWOq/bDOoK8Y4H5wl3cpHpU7YUaYDBzhrj
	 MjSnuCwLaDyVaTMlHnoX4ENNna/V3jKJvfqY14Lg44KoLugc2eHNTS4uFrAOCfGSpv
	 7uR2WIlAPInj4mMVOfFd2zc9xL4Y2aIkZ2skhsYjNOVWiEEn2QHUMb7KPPorbtBw3j
	 tam55lkj9DCHAol2cte/ycM40isssYCX0WKW92V2D+54WG+pFRc5cVBN8jdPnV2atN
	 GpimgpOerNJBw==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Robert Marko <robert.marko@sartura.hr>,  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] ath11k: Enable threaded NAPI on WCN6750
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
	<20220720135113.15755-2-quic_mpubbise@quicinc.com>
	<87czceaqng.fsf@kernel.org>
	<dcc14883-51c9-c1bb-bbea-1b309eccedf2@quicinc.com>
	<CA+HBbNGEoSyfbs=FHtWyvBnG_jh9m=Q9KW=Pcfq+pDdHWEV4mw@mail.gmail.com>
	<7615c815-ca2e-c6f1-b627-6e10f1272442@quicinc.com>
	<CA+HBbNEm9GhYcXQ9gXEb=U4x=BZTDp4UBqF8eNH1N0uCBLdadQ@mail.gmail.com>
	<5c07bcd5-574c-b13b-44c2-ef8ed9f23cf0@quicinc.com>
Date: Thu, 08 Sep 2022 09:46:53 +0300
In-Reply-To: <5c07bcd5-574c-b13b-44c2-ef8ed9f23cf0@quicinc.com> (Manikanta
	Pubbisetty's message of "Fri, 2 Sep 2022 20:00:55 +0530")
Message-ID: <878rmucqhu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234700_625081_21C01AE6 
X-CRM114-Status: GOOD (  16.25  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> On 9/2/2022 7:16 PM, Robert Marko wrote:
>> On Fri, Sep 2, 2022 at 3:42 PM Manikanta Pubbisetty
>> <quic_mpubbise@quicinc.com> wrote:
>>>
>>> On 9/2/2022 6:50 PM, Robert Marko wrote:
>>>> On Fri, Sep 2, 2022 at 3:18 PM Manikanta Pubbisetty
>>>> <quic_mpubbise@quicinc.com> wrote:
>>>>>
>>>>> Regardless of the chip family, even I feel that the tput changes like
>>>>> these should be tested on all the chipsets. Availability of the hardware
>>>>> and time are something which are stopping me in testing the changes on
>>>>> all supported targets.
>>>>>
>>>>> As I said, I had made the changes only to WCN6750 initially (using a
>>>>> hw_param). Can we take that approach for now and enable this for other
>>>>> targets only if required & upon thorough testing?
>>>>
>>>> I can tell you that on IPQ8074 threaded NAPI really improves perfromance.
>>>>
>>>
>>> Great. Do you have any test results on IPQ8074?
>>
>> I dont have full test results, but on Poco F2 Pro as the client @80MHz AX
>> I got ~720Mbps compared to ~550Mbps before.
>>
>> I can tell you that in OpenWrt, we have had it enabled for 6+ months
>> at this point
>> and its been really good.
>>
>
> That's a significant improvement, great to hear that. We have another
> strong reason to have this change in upstream driver.

Indeed, thanks Robert. Is the code in openwrt similar as what
Manikanta's patch does?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
