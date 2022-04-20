Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3950C433F5
	for <ath11k@archiver.kernel.org>; Wed, 20 Apr 2022 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGk9yGghbwrfvokiLmvbm0fMFKDUSpLW3jYCwzeyBNY=; b=iYoYDnyEdHE3R5
	XY7+keYGhnHZw+OjGqFpx7qy0A84yWsG0WOyDxbjFnwCpnMTn4L3GyjxYj0DH6el36odfistWxSzE
	t+KQ0j8nsiu2LdgaZHSbRXKA9LCCw4TCWI0imdJpgLch522uUlvMdQBENlcDgIJpWC7NbplI2X0yB
	L12DLHhBO836rWfNBldl2BN81wmf3Gx/Kw3MovmKVqhhD8rH8ARlnuTo1SH4EuWUWyB9BOMWPGng2
	8bugJfa2WGLCSigZNXx12AAaQ6kxxBCUKMhFNUmkis/4q1bUvaFPj+f59psORLWpVQvbXQZ/DIgBe
	uVDD0LsUkKk2bez8APgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhDIS-009iB5-8B; Wed, 20 Apr 2022 16:35:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhDIP-009iAS-NR
 for ath11k@lists.infradead.org; Wed, 20 Apr 2022 16:35:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8070161821;
 Wed, 20 Apr 2022 16:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE845C385A4;
 Wed, 20 Apr 2022 16:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650472510;
 bh=9ejcmMDe5SdSPg8+S6T6l9v/lhyBsRC+v5fAmICWhf4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=G0esuMOiYcfLJhQ/UB7sCdfiBh/6Ap5hQ7GQs+Sa7Ndwab7+NMhzkUJbkzD8qA4dQ
 Ei7n45c8TeCu7DRwhkC+GV4m2QDmScPeAHGgB5izYpK7vz3LsHUIEkq0W/8P/1TqGQ
 kOwB4zon3v9gJEr48RYlDA3a/k8MBoPEg6mf96ucWjgXY5ux20d88+odxoT8m9Wwqx
 Mbi5a0tU/T9Aw7HXkCBhYTUSDDFFf8wD17N5JWSWLP4CcvickD9JhswCWx7MCuRZ7m
 9FBrNfNZQVUw89rv3nwfh2KUOAgK6RuRWRIPFzNWmg09THzSNEcfyQ138N3G2vEQMG
 URbLo5IqwpstQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] ath11k: add support for extended wmi service bit
References: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
 <20220401120948.1312956-2-quic_bqiang@quicinc.com>
 <4f421eab-1ace-51c6-e677-42b32b6afc56@quicinc.com>
Date: Wed, 20 Apr 2022 19:35:06 +0300
In-Reply-To: <4f421eab-1ace-51c6-e677-42b32b6afc56@quicinc.com> (Jeff
 Johnson's message of "Fri, 1 Apr 2022 11:07:51 -0700")
Message-ID: <87h76nogqt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_093513_837917_A2CBE552 
X-CRM114-Status: GOOD (  20.86  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 4/1/2022 5:09 AM, Baochen Qiang wrote:
>> From: Wen Gong <quic_wgong@quicinc.com>
>>
>> Currently the wmi service bis is report from firmware, it is divided
>
> "bis" is a typo?
> Also use of "Currently" here is confusing since it seems you are
> changing that behavior. But the firmware reporting isn't changing,
> only the host processing is changing.
>
> So perhaps:
> When the WMI service bits are reported from firmware they are divided
> into multiple segments, with 128 bits in each segment.
>
>> to 128 bits for each segment. The first segment is processed by
>> ath11k_wmi_service_bitmap_copy(), the second segment is processed by
>> ath11k_service_available_event() with WMI_TAG_SERVICE_AVAILABLE_EVENT,
>> When the service bit exceed 256 bits, then firmware report it by tag
>> WMI_TAG_ARRAY_UINT32 in WMI_SERVICE_AVAILABLE_EVENTID.
>>
>> ath11k does not process the third segment, this is to extend the wmi
>
> Here is where you can use "currently". And this is also a good place
> to say why the change is needed since that is also missing from the
> commit text. So consider:
> Currently ath11k does not process the third segment. Upcoming features
> need to know if firmware support is available for the features, so add
> processing of the third segment.
>
> Also IMO the implementation details below do not need to be in the
> commit text.
>
> I suspect Kalle can just apply these comments to his pending branch.

Did that now, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=d98a4c9bd0b32824ad9ee2d24ecabb345edfaafe

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
