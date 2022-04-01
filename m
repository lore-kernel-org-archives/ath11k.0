Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EB1C433FE
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQD13LJHWbcUc6hwEqAP6HKWlNazXlgpwT7dxqAETBI=; b=Uu9vU4sEi8K//F
	Q0uKYrxUiR2RqnnlQMDd3Aaf0Z8FDwpxCbm97U+JNVuQ9HGA0MQzVgyAlmKubGv4OrF0ZKOT2vmTB
	jH1R9oNW5laMHFMGMCwDY4CLHVEEXySKU5bDjvNWKLW/ZaAgBYOkgKLEPhzYzxC0okE2QS215bHF6
	LjnONMRekS5eR/gewkQd0Rnbh3XNsWLYBAdIsH3AOiBFv+Yo0r70VO9/IhmnEH7wNTEilgIfsVPd0
	LW5/TZw05ISNj8H2qQyXeQ1cZLKPwh9E3S897gAFSCNJoJTOEGkjENmMwFn//O0KfXvwx1K1zZJ99
	fPdmsunUrBGNPWzwFLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naFbf-005O4j-M0; Fri, 01 Apr 2022 11:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naFbc-005O46-Hr
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 11:38:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24528618F1;
 Fri,  1 Apr 2022 11:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0F5C2BBE4;
 Fri,  1 Apr 2022 11:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648813093;
 bh=JeZ02QkfWVzX6ts+UvtEHBfdA9PpxWAQowCGmjr19R0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=P7yd6E74dtHmw5gQgplfq0oqYqm9HXuoAt+DAPxAekQjzUHm6Mmcm+nyL9wX6Ij5u
 4x6kDEZQdJyHO1mb3VCraxt1SXA01L6IiqVeSG8Kz6YVeF0QrnGznpiUG99FwRqBiw
 JjUHzmDemt/o6nUHKE2bOGjc/96S5gdJp0oVyIMHdabOebJT9GACwEojM8re73qMjK
 bnWuIN7fn4tZLkSC1hJjXo4V0Et99sRLElNOMQoYUCs5z86fM+nKCu+5EgPp9zcdUv
 5ccoKK3SYXNXGXy9k3+o3p2tuyS0OO7K3Ff/xLBkqsZ+iu8V/V+Jw7ny56282suNZ9
 GUZEBvodhBE3w==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] ath11k: add support for extended wmi service bit
References: <20220401073200.1195070-1-quic_bqiang@quicinc.com>
Date: Fri, 01 Apr 2022 14:38:10 +0300
In-Reply-To: <20220401073200.1195070-1-quic_bqiang@quicinc.com> (Baochen
 Qiang's message of "Fri, 1 Apr 2022 15:31:59 +0800")
Message-ID: <875yntuj8d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_043816_665978_A388D382 
X-CRM114-Status: GOOD (  12.56  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> From: Wen Gong <quic_wgong@quicinc.com>
>
> Currently the wmi service bis is report from firmware, it is divided
> to 128 bits for each segment. The first segment is processed by
> ath11k_wmi_service_bitmap_copy(), the second segment is processed by
> ath11k_service_available_event() with WMI_TAG_SERVICE_AVAILABLE_EVENT,
> When the service bit exceed 256 bits, then firmware report it by tag
> WMI_TAG_ARRAY_UINT32 in WMI_SERVICE_AVAILABLE_EVENTID.
>
> ath11k does not process the third segment, this is to extend the wmi
> service bits from 256 to 384 for the third 128 bits. The 3 enum value
> WMI_MAX_SERVICE(128)/WMI_MAX_EXT_SERVICE(256)/WMI_MAX_EXT2_SERVICE(384)
> are convenient to process the service bits.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Baochen, you need to add your own s-o-b in the end. Please read:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

But remember to keep Wen's s-o-b, they should be never removed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
