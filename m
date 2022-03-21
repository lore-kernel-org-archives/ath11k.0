Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33E2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClvV5DJstLa8j++56FJyzb1KhposDfoKKJ/woYZlDX0=; b=2cAuv3atQQiRYN
	/iJEq+c5qNSCC7EPlaU/etIAz6eyEM0J+aLkCsNIX1WN1Gqmrbol0hOCX0UDZ2lKFns5fQ2B7Ex4w
	q55qy1lm2Xg8LIQfEnXsByqYUlWNhalg6vWaWgUcAgnn0IWEAtaDsy42cpcs4wGx7XPMPAHr2I4cC
	FJMjhdMM3CP7u3Bm/ta/JS7Y0pgBsD5o+zmeKjVu6VuKkLZnuGPZ+IHJcx8Q6ZRRswXtVgfnpv4gb
	5mFY5Gny+H4mSE/aLCYKyIS9u4lC4c6vKTFq3OjcDtB2fQW5VDs4imn0CnoAIhEPkvpLEVp7cFsHG
	OS3hpnqLtR9fpWRZ/szA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWElg-007EOt-4m; Mon, 21 Mar 2022 09:56:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEld-007EOC-K8
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 09:56:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4518AB8117A;
 Mon, 21 Mar 2022 09:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2596FC340E8;
 Mon, 21 Mar 2022 09:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647856558;
 bh=T3DLppXj5kZ65OViVxUgR02m2i078NFkHdhZT/bt0is=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ttaU4o3bsSTAOIBvXsaAMrJ5FZvO7mdSUJ3jSFp9oVooBMObBbdAIa4OFIfHVxxlc
 f1gR3KBbbSx19t2Jt8hnNFSpYJQAYy2A8/2EtayNNFxtzDk8mNnsUZWLnoVPAvDRCP
 pQ8qPpa0A0c6jMQZVFSUAJ435c9687bh6Rxl9PuM4SzmX9u7Yz4VINJtsFkcFNsepL
 3NEfGM4p/ub0VYIljAOX2TPrWWqh+hBxj5kEd0CLvORwY3kTW7f5NwhBAm+Z2AECdv
 WnZX0RKJWM1XEDXef/aXRh85UG1bibP3idcpeijrcd21tUNT8VtmCbNdpuGCCU8QbI
 LahA6ccKbvovg==
From: Kalle Valo <kvalo@kernel.org>
To: "Baochen Qiang \(QUIC\)" <quic_bqiang@quicinc.com>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: Add support for SAR
In-Reply-To: <BYAPR02MB543076C526E59CB0E98B3DBCE0169@BYAPR02MB5430.namprd02.prod.outlook.com>
 (Baochen Qiang's message of "Mon, 21 Mar 2022 02:24:47 +0000")
References: <20220317012728.18932-1-quic_bqiang@quicinc.com>
 <164761864196.8951.13534371903381562941.kvalo@kernel.org>
 <BYAPR02MB543076C526E59CB0E98B3DBCE0169@BYAPR02MB5430.namprd02.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 21 Mar 2022 11:55:53 +0200
Message-ID: <87fsnbocie.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_025601_839139_2A6C0A94 
X-CRM114-Status: GOOD (  19.77  )
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

"Baochen Qiang (QUIC)" <quic_bqiang@quicinc.com> writes:

>> -----Original Message-----
>> From: Kalle Valo <kvalo@kernel.org>
>> Sent: Friday, March 18, 2022 11:51 PM
>> To: Baochen Qiang (QUIC) <quic_bqiang@quicinc.com>
>> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
>> Subject: Re: [PATCH] ath11k: Add support for SAR
>> 
>> Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>> 
>> > ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops, and
>> > this function is called when user space application calls
>> > NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR type and
>> > frequency ranges to wiphy so user space can query SAR capabilities.
>> >
>> > This feature is currently enabled for WCN6855.
>> >
>> > Tested-on: WCN6855 hw2.0 PCI
>> > WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> >
>> > Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> 
>> What did you use as the baseline? I could not able to find an ath- tag to which
>> this patch would apply. I strongly recommend using --base, that way I don't
>> need to waste time trying to guess what was the baseline.
>> 
>> Patch set to Changes Requested.
>> 
>
> Hi Kalle, I have added the base flag in v2.

Thanks.

> And please note this patch depends on
> https://patchwork.kernel.org/project/linux-wireless/patch/20211224085236.9064-2-quic_wgong@quicinc.com/
> which is now in public review.

If there are any dependencies, please document them clearly after the
"---" line. I don't have time to start guessing what dependencies there
might be for your patches, especially if the dependency is several
months as in this case.

But why are you using that patch as the baseline? It's marked as Changes
Requested and it's unclear then it can be merged. If you need that
patch, you should create a patchset with patch 1 being "ath11k: add
support for extended wmi service bit" and patch 2 being "ath11k: Add
support for SAR".

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
