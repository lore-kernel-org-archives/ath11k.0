Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C280C6FD20
	for <ath11k@archiver.kernel.org>; Fri, 24 Mar 2023 05:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PebVFcTlIaZXJCnCwJ29Lw5ULyblNhh4Ewa4MgXo3g=; b=TVwu+HLkFJyQUC
	Lhsl8d7ATYzRjgw0pMRYWPPAqaHf022wMpFxkrDqya509zD0PqMNWiQ3ODVTES3cna1HrIuPxlhkw
	vLauNR9UCbSlB6POBbTiidiFxJOSOTvjMKkyZT2R+OmlkV5m26t6jpm22HnVCmQUJqk+iLy+kk3rt
	Pwj4qBRVGJCxpwgYEz0ounKgOKz36hKgxZHEhsrtuDuC08BcxQlRxOYb22MAAkzkZsAzCi4gJLSSp
	ZjtvGk40nCyuY4msRYFLgraK8Eud57Uye4aoq/QTjAu6uefMoihcX1lIrBsqknzteN93c+tfr8Ser
	D7tbd3oDB4uAr3BkywEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfaBO-003com-02;
	Fri, 24 Mar 2023 05:41:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfaBL-003coJ-0h
	for ath11k@lists.infradead.org;
	Fri, 24 Mar 2023 05:41:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 94F51B822CD;
	Fri, 24 Mar 2023 05:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B824C433EF;
	Fri, 24 Mar 2023 05:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679636500;
	bh=h29nt0gEMF/1LgqRHfjBAUDV0ke/wpAkbvezYM26cRE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V56mWhUY5/ISlJsP5G3oazS58WlawYqZK9D5OZzDxvGmHzIRn57vwBKZPjnbETpZN
	 zqbkEnb3VYQgNEfGbpZc1pdTSA9vWwE2f/MIQn74QdCmYVuoH9yLQuJ5psRNG5vaSA
	 BObndQkOGaKv2uCeC2Hhh/TrKScRTztdwLJzU06DPTNi4B+oX3imzfNbcyYj2A9/l5
	 Yk2s5DF8Wi+dv9jrFWd7/CkFLb88IuCpYj2hIcejEjinlteC13Z38AuhKd4mV/hLI4
	 oa7SeZCUsddcxC+OIMa71S2GIVusPEed810snnPK3lM/6vzqpsl/Rj/IVIq7UrN+fD
	 /1tnzrk89naiQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] wifi: ath11k: Optimize 6 GHz scan time
References: <20230315112103.18426-1-quic_mpubbise@quicinc.com>
	<167948612507.6445.2579526780286789940.kvalo@kernel.org>
	<2152e5f1-cecd-f5d2-ca4b-e7ed159f40b7@quicinc.com>
Date: Fri, 24 Mar 2023 07:41:34 +0200
In-Reply-To: <2152e5f1-cecd-f5d2-ca4b-e7ed159f40b7@quicinc.com> (Manikanta
	Pubbisetty's message of "Thu, 23 Mar 2023 11:41:14 +0530")
Message-ID: <871qleemep.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_224143_546691_AD46421D 
X-CRM114-Status: GOOD (  13.95  )
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

> On 3/22/2023 5:25 PM, Kalle Valo wrote:
>
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:
>>
>>> Currently, time taken to scan all supported channels on WCN6750
>>> is ~8 seconds and connection time is almost 10 seconds. WCN6750
>>> supports three Wi-Fi bands (i.e., 2.4/5/6 GHz) and the numbers of
>>> channels for scan come around ~100 channels (default case).
>>> Since the chip doesn't have support for DBS (Dual Band Simultaneous),
>>> scans cannot be parallelized resulting in longer scan times.
>>>
>>> Among the 100 odd channels, ~60 channels are in 6 GHz band. Therefore,
>>> optimizing the scan for 6 GHz channels will bring down the overall
>>> scan time.
>>>
>>> WCN6750 firmware has support to scan a 6 GHz channel based on co-located
>>> AP information i.e., RNR IE which is found in the legacy 2.4/5 GHz scan
>>> results. When a scan request with all supported channel list is enqueued
>>> to the firmware, then based on WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND
>>> scan channel flag, firmware will scan only those 6 GHz channels for which
>>> RNR IEs are found in the legacy scan results.
>>>
>>> In the proposed design, based on NL80211_SCAN_FLAG_COLOCATED_6GHZ scan
>>> flag, driver will set the WMI_SCAN_CHAN_FLAG_SCAN_ONLY_IF_RNR_FOUND flag
>>> for non-PSC channels. Since there is high probability to find 6 GHz APs
>>> on PSC channels, these channels are always scanned. Only non-PSC channels
>>> are selectively scanned based on cached RNR information from the legacy
>>> scan results.
>>>
>>> If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set in the scan flags,
>>> then scan will happen on all supported channels (default behavior).
>>>
>>> With these optimizations, scan time is improved by 1.5-1.8 seconds on
>>> WCN6750. Similar savings have been observed on WCN6855.
>>>
>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> New warning:
>>
>> drivers/net/wireless/ath/ath11k/mac.c:3827: line length of 91 exceeds 90 columns
>>
>> I couldn't quickly figure out how to fix that, any ideas?
>>
>
> I'd thought that max_line_length is 100 from the checkpatch.pl

In ath11k-check it's set to 90.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
