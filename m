Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB2C433F5
	for <ath11k@archiver.kernel.org>; Wed, 20 Apr 2022 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rmlf/1xqbuHNhIjOXXbBiAuCLTLd3eAI0MIFPx3ZqeM=; b=3FGOwnIo0QyJJP
	rVjSUc/mkzbhrxvk6WlqSmRLZ7LGAOma20i4aqyV4N1CeHeVTwyfJ6TluqK5PBhzWMekw07wFM+YJ
	rLkHb8fE9DvZAr3jcjjwSMXSF2anMW9H0lc5xu5X009sb3WZ+ho0YitlCW5hKFpKZ4ktgppvXZMmJ
	nFcmjFnHMERA6ZZFm1i91P+SgGBhWR6g3/KYA36IpPkvLh+HOHuw6yXtBeKszhUmqCVdFvYFmLKxV
	vQ/oa06Z+cKekltrP7N2ZpIUiTt+QllkScheB1FIrY9e6hawl99tQymrIaH2UgGZ/FhvNbc2R+OdV
	jOwHdabrnqOK50zzgPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhDJ2-009iEt-Jm; Wed, 20 Apr 2022 16:35:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhDIz-009iEU-5T
 for ath11k@lists.infradead.org; Wed, 20 Apr 2022 16:35:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F5F661A1E;
 Wed, 20 Apr 2022 16:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18445C385A4;
 Wed, 20 Apr 2022 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650472548;
 bh=X4OCNceuUdOmJ6pHXdidkIToDf/6iJZO1Nwm8PptHCw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=rOhxEadSAFSWOFJVT7fk3pfeQ3evZubnWGtIHe4A7ipZ6q8GeclA862PbFaudVDMB
 iFDOsiM5HPJoF3xRKI7VNL9c/GQ7W76boIdIId4KbcZ5upi/2SzueW0t8+TOHHNi12
 c2X7YPabhshOTZ+8bwN+mgOavnL88FIMfjH6E7JAx+dk/tNDLsqhQVeagiW1KmSU7Q
 +V/nnVIjGcChcYyGJ7yhhGuBLAdz7A1ipyKuW2rIlC2howJa5udeTPeJtPfQoilAmQ
 ErIOxzmh6VZg+ug0MFNq6zuMTEmVtnis+8mloVP+zh/Jwm6FnbAwWLGa+Pw9s1Y2Xg
 X7OzPpWqRx/OA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] ath11k: Add support for SAR
References: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
 <20220401120948.1312956-3-quic_bqiang@quicinc.com>
 <cb07aa82-2971-69dd-bf80-ff7f0cff4569@quicinc.com>
Date: Wed, 20 Apr 2022 19:35:45 +0300
In-Reply-To: <cb07aa82-2971-69dd-bf80-ff7f0cff4569@quicinc.com> (Jeff
 Johnson's message of "Fri, 1 Apr 2022 12:06:44 -0700")
Message-ID: <87czhbogpq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_093549_282429_82EAB15F 
X-CRM114-Status: GOOD (  14.54  )
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
>> ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops,
>> and this function is called when user space application
>> calls NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR
>> type and frequency ranges to wiphy so user space can query
>> SAR capabilities.
>
> I find this commit text very confusing since it uses "present simple"
> tense instead of "imperative" tense so it comes across as describing
> what the driver did prior to the patch instead of what the driver is
> supposed to do after the patch is applied.
>
> The patch itself LGTM.

I tried to improve the commit log, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6b0778eaea60533a8b48df2d890543a48b590f55

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
