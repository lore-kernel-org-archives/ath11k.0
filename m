Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC17C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 08:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvxmXZWG0FcZI2Ee8KYaf4Gmq4SSLhKKI1n2UypeJLA=; b=VnJGsr8K0984fn
	aAXxnsJFwTboC8slATouaJPM/br4xZxVImMxGU/adpbwY29SHpbiTNlzIUPE709Z/sw3WlksanpcQ
	/1tzye5axgRAUJFBuJk6GyWkkYXiKuTIF67WZGCuTfpc2ZoQbcNT8wxt0ThjXWEh8vB9VKD9DncOs
	K3ekctvGz1ErP3qHtlUE5Tpaxiqll2N+hmavvpRJGfQYUzzIETi7tvEX8TM1haceiR7frzEA4rTaO
	1c0ONWjA+FVjFypJSn0UPyygmY/V6dv7glAYzdqujVjo7Rf4f+YXODcNZbcbotu7CGIfWuBu1uzz2
	1fYwt3+nHgA0400GjcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvEPs-00FCxP-KJ; Thu, 09 Dec 2021 08:04:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvEPp-00FCwu-L6
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 08:04:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53122B8235F;
 Thu,  9 Dec 2021 08:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A38C004DD;
 Thu,  9 Dec 2021 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639037071;
 bh=9lhxZnXHHgRYM2mz4B6k4tmudvFg62aL32BOfwzQz+k=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=V3zNQ1Nay5QJjhOweBn6oLHUfnyicgh2Wrh82gHmxTMwVKdXu+tqO+mTmQs+HKM2B
 PDhTkuKPD7hKYJweH5D8Mxc2T1UtBPrvPHS0zvCy2rpOnYa+j36SHQ6ktrc2lm8LFm
 0bax1gppPiu4WLAqso1f/6MKRdvuzD5qXnnjcDXKIb7ygmOt7RXecpajv1Dy3VCSYV
 FlKdxlQS7RGgnnWIT8pjXegi3azwuU8KTijWcoADRlpa4SeDTRvUKYMEGh6GGW6YD6
 C+EfiwwnOm1kgdxEL7u3/ndKxuDc0JLdi/DjsxD5IdD1r3BTdLTrQjKsNOxjmxt4W/
 miiJHDfQm453w==
From: Kalle Valo <kvalo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
References: <1638789319-2950-1-git-send-email-akolli@codeaurora.org>
 <Ya+/pawARpqHwTES@robh.at.kernel.org>
Date: Thu, 09 Dec 2021 10:04:27 +0200
In-Reply-To: <Ya+/pawARpqHwTES@robh.at.kernel.org> (Rob Herring's message of
 "Tue, 7 Dec 2021 14:10:13 -0600")
Message-ID: <87y24u431w.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_000433_858319_7009DE58 
X-CRM114-Status: GOOD (  14.02  )
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

Rob Herring <robh@kernel.org> writes:

> On Mon, 06 Dec 2021 16:45:18 +0530, Anilkumar Kolli wrote:
>> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
>> Ath11k firmware uses host DDR memory, DT entry is used to
>> reserve host DDR memory regions, send these memory base
>> addresses using DT entries.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> ---
>> V4:
>>   - Fix dt_binding_check warnings (Rob)
>> V2:
>>   - Use reserved-memory (Rob)
>> 
>>  .../bindings/net/wireless/qcom,ath11k.yaml         | 30 ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>> 
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

Anil, please clarify. I can add the Rob's Reviewed-by if nothing was
changed since v6.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
