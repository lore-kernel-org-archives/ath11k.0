Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F1C433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 13:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2e5C3GujK+9o/VOGR9X8Ewyk3iZkt6ecGYOA7cG3mZw=; b=b3NqcFAd/nGLSs
	4FNtbxdQxxhJWjN8OLSmJ2E5E4cWayVNoBLII7JWjW/PRMzc/2QNj56NTT/Vh4BfCB20ptJO5fpFo
	isIyuCVXBDTzDckThK5/OnFWoBI/1dBaf5sNP4TNYPrEmWbZk2XxQ2lbTXXb8tORM3jK8w7/no1jN
	//0W4TaRH5aGyGU6wx2Idg8Bwfiikd0A9NRv0MLwIoNhW6D4EcCl/wzAUFzH/+ZGzmYDjDYhauKgA
	nWWbCNXILpTjUC3AuwfRHKZl+oofoKWt+18pJmegg3Yk4/w23bv0U5zZhhOGMKeuqxDsO5ptSYdrE
	UEE4Zrsw2IARNoYbG/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDRZT-002QUR-Nm; Fri, 28 Jan 2022 13:45:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDRZQ-002QSZ-7i
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 13:45:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82418B825AE;
 Fri, 28 Jan 2022 13:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5D4C340E0;
 Fri, 28 Jan 2022 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643377541;
 bh=NjUDQHcjwK8tiNfbwas8lP+FG2pv6UYPQhclQj/xg8k=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=U1MRGDNuTmFojua+kl5Aex8Qp42imoq3ArREE3DrOngcd2rW/94ZisIy2f57zRL/D
 +Z4q22pvx1RCZWNLEoIqRMZtRHzTdoPrmXddPxkkWMpDWFbqr3/Va7DZctnJkiRMuW
 qPcHXH5Ao3wFWYth+dMSc/6ho0Bce8EXrvdAK6DRO3szRjhBQPwdBsxYq4z+CbM/7G
 GctXYnJFV5MU37iHfBs2/SEdyF7nCeA3TvifF/sv69a2urPoUv2imnHU15KVxa2Xj+
 TbXJXAASiqe0NppQx/ZrZO9sAoFrNhVfgdJyxKABPDCjjeooNhnEypd98j24fqzddA
 ZsX3psE8UHWWA==
From: Kalle Valo <kvalo@kernel.org>
To: Cheng Wang <quic_chengwan@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: add register read debugfs interface for WCN6855
References: <20220125063731.3049556-1-quic_chengwan@quicinc.com>
Date: Fri, 28 Jan 2022 15:45:38 +0200
In-Reply-To: <20220125063731.3049556-1-quic_chengwan@quicinc.com> (Cheng
 Wang's message of "Tue, 25 Jan 2022 14:37:31 +0800")
Message-ID: <878rv0ezy5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_054544_456398_E7D6CB3B 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Q2hlbmcgV2FuZyA8cXVpY19jaGVuZ3dhbkBxdWljaW5jLmNvbT4gd3JpdGVzOgoKPiBBZGQgZGVi
dWdmcyBpbnRlcmZhY2UgcmVnX2FkZHIvcmVnX3ZhbHVlIGFuZCB1c2UgdGhlc2UgdHdvIGludGVy
ZmFjZXMKPiB0byByZWFkIHJlZ2lzdGVyIHZhbHVlLgo+IEZvciBleGFtcGxlLCBleGVjdXRlIHRo
ZSBmb2xsb3dpbmcgY29tbWFuZHMgdG8gcmVhZCBXQ042ODU1IEhXIHJlZ2lzdGVyIG9mCj4g4oCc
bWVtdHlwZT0weGEgb2Zmc2V0PTB4M2EwMGQw4oCdOgo+Cj4gJCBlY2hvIDB4YSAweDNhMDBkMD5y
ZWdfYWRkcgo+ICQgY2F0IHJlZ192YWx1ZQo+IDB4MTAyMDAwMDAKPgo+IFRlc3RlZC1vbjogV0NO
Njg1NSBodzIuMCBQQ0kgV0xBTi5IU1AuMS4xLTAxNzIwLjEtUUNBSFNQU1dQTF9WMV9WMl9TSUxJ
Q09OWl9MSVRFLTEKPgo+IFNpZ25lZC1vZmYtYnk6IENoZW5nIFdhbmcgPHF1aWNfY2hlbmd3YW5A
cXVpY2luYy5jb20+CgpUaGlzIGhhZCBuZXcgd2FybmluZ3MsIGZpeGVkIGluIHRoZSBwZW5kaW5n
IGJyYW5jaDoKCmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvZGVidWdmcy5jOjEyMDc6
IGxpbmUgbGVuZ3RoIG9mIDk2IGV4Y2VlZHMgOTAgY29sdW1ucwpkcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTFrL2RlYnVnZnMuYzoxMjUzOiBsaW5lIGxlbmd0aCBvZiA5NCBleGNlZWRzIDkw
IGNvbHVtbnMKZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kZWJ1Z2ZzLmM6MTMxODog
bGluZSBsZW5ndGggb2YgOTEgZXhjZWVkcyA5MCBjb2x1bW5zCmRyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMWsvcW1pLmM6MTY3MzogbGluZSBsZW5ndGggb2YgOTQgZXhjZWVkcyA5MCBjb2x1
bW5zCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVs
ZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJz
L2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
