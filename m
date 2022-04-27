Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE89C433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a00L5PF9gAa8lVKOU9F/uJbK4EV2eoVPYHuMNqtrPQo=; b=A4eX003FmZ4+r6
	fvg+wPU0EZHkeoC7QCBarM78/1QTLQKgTI/xFucXTJPfd6NU8/P4KvowNWgJzUTJG+v4e/OWfs7y5
	2IK4XfI9Z17avYPn6j6Vyhu4QdIG3lwUR1oa1pyhTjMCjFQoJgSg+c/SRj+BPkPyvCWvDGynQYGCW
	NOH5SaEzXV9C85HyKckmZvwoCMpozV8E2XjSjH8q7S/zovCqOTJyjpaBc2OZy8yNJjevf9oeqkz2r
	jhqtOZB3TE0bNw5ZPy8ribXlHbBrEi+gXVAnBoOBmiWOLWDm6LIjDdj354RNkhUfMB/3h1pVQMFiO
	Jl8oN0DYV0V3ImM/cI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njZzx-00HRtg-0e; Wed, 27 Apr 2022 05:13:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njZzt-00HRt7-TS
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:13:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CFE26136F;
 Wed, 27 Apr 2022 05:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68845C385A9;
 Wed, 27 Apr 2022 05:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651036432;
 bh=xTF+yKrSWLuvuV03D2dhdn9f/P9hF8bFAdNp1Z38lbw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=L40PUmY8eS9XKJ0DrkX15ae7Jyw+cxpol+DixnLYhrMkGZDLXv6drWamCka/bYuY2
 SCib48ZyLvuyWFUxlcmJBiwdkNq7bQ5CEqsoYxIWrhtDWlwZjwVDJgCMZ3So5q6B2r
 Rx46AvJe7VFdY7D/S9ameshBz3NB2DM/sW+JmZZQCiCSHFY430znzGkWAgvvz92UTA
 NJ3LcsG3q53fqQKYZENCr6x5w6hDtnckqXXJhA1cWWKpMyqvNRSbkXG/XxooPwu98g
 HtsR0AMHE92dy51rZttgIVHFaa5jJe3UclOdhE0LkraEnhnF9BFciHl5q2Upwo0DhY
 IWd5CjyJP+TWw==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, <linux-wireless@vger.kernel.org>,
 <mka@chromium.org>, <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-2-quic_mpubbise@quicinc.com>
 <Yk2s+srO9DKP7xW1@robh.at.kernel.org>
 <e2fd6542-38fe-a855-1d8f-65799970727e@quicinc.com>
Date: Wed, 27 Apr 2022 08:13:47 +0300
In-Reply-To: <e2fd6542-38fe-a855-1d8f-65799970727e@quicinc.com> (Manikanta
 Pubbisetty's message of "Thu, 7 Apr 2022 10:51:37 +0530")
Message-ID: <87zgk7hzw4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_221354_032416_CA4D374F 
X-CRM114-Status: GOOD (  18.12  )
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

> On 4/6/2022 8:38 PM, Rob Herring wrote:
>> On Wed, 06 Apr 2022 15:10:55 +0530, Manikanta Pubbisetty wrote:
>>> WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
>>> Though being a PCIe based solution, it is not attached to
>>> the APSS processor (Application Processor SubSystem), it is
>>> instead attached to another tiny processor called WPSS Q6
>>> processor (Wireless Processor SubSystem) on the SC7280 MSM,
>>> where the WLAN firmware runs, and it is the WLAN firmware
>>> running on the Q6 processor which enumerates WCN6750, as a
>>> result APPS processor would never know such a device being
>>> present in the system and would not detect the WCN6750
>>> hardware unless and otherwise WCN6750 is registered as a
>>> platform device. This is the reason behind adding WCN6750
>>> WLAN node in the device tree.
>>>
>>> Add WCN6750 wireless driver support, its based on ath11k driver.
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>> ---
>>>   .../bindings/net/wireless/qcom,ath11k.yaml    | 361 ++++++++++++------
>>>   1 file changed, 252 insertions(+), 109 deletions(-)
>>>
>>
>>
>> Please add Acked-by/Reviewed-by tags when posting new versions. However,
>> there's no need to repost patches *only* to add the tags. The upstream
>> maintainer will do that for acks received on the version they apply.
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
>
> There are changes in V4 but nothing significant, I have missed adding
> the tag, will make sure to add relevant tags going forward.

I added Rob's reviewed-by to patch 1.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
