Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E635C433EF
	for <ath11k@archiver.kernel.org>; Sat, 23 Apr 2022 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=591geg4aDDsVRvs3qr5wuabxiAqKIdUumNAMYaEgcQ8=; b=3rZRzqJ9eaL1a8
	KBnZbA+wMXDMbRQn01cBiOWK5FJLpnF0/I3NxFbJmq91Hort5orvmA1+/7slHnDiqO7+8h60f4sm3
	9ULg9A86mxE7KtyeOVH89ETYXu5XSl53dKQEFBcG800QZPdJ1zwGjAwT9lwfKP2WfkU8IBZc5/OOO
	VJ7f8n7QY7cemkLFntQ/pOBkZKu4EXa15WIPKt+21/Lv4K9PVzBH2jPjXuugEvxkZ8VVqhaXf0bvX
	18tl7UoYsfWSvA4ajuXVJOCrkv2Eyw4tgaYrj4aIF9oHP8WHZY8r0jo+stvZ3oVLHmWvG0IH3eyEi
	VEefAQ+gEntB62V6M8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niCi4-00438e-Pu; Sat, 23 Apr 2022 10:09:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niChD-0042ic-M4
 for ath11k@lists.infradead.org; Sat, 23 Apr 2022 10:08:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3AC1C60F37;
 Sat, 23 Apr 2022 10:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2931C385A5;
 Sat, 23 Apr 2022 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650708534;
 bh=ogyQbiHrQpnUX0/aC7NJX0rW89dZuZAwwBzIsZ2eN1I=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=PJtmZStzCqYCU3SLza7x8weW+r8vp82Zy4MBbh1AEoXlnn8bpm6I5eHquPREkeGjS
 iREt3T7ygBZMpe8emdoIDWeEpxhAZhrgHAOCmFbzDdyWACUP3eOpxlT1CGyu+Gke1c
 XLGyeV+2zet2VVBVlfg7tYeJSWIipp2uIQQzTZvjhYbhqxWEm52JXZ+CDovet4+WKN
 kmJRWQOE8vaKYXYwhoN+KLTDEm5nCdzRIuopIPouZcyCoUhKnq5oXrYlTeQFojVWWt
 aaIeby3HsEb4BpxzcioDr+aSonfSMA0qo+cBN4ku6A2lWV0LyhEj6RUl98nIls/Abp
 dnXBsBveDHnMg==
From: Kalle Valo <kvalo@kernel.org>
To: Cheng Wang <quic_chengwan@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] ath11k: add register read debugfs interface for WCN6855
References: <20220207084540.3661100-1-quic_chengwan@quicinc.com>
Date: Sat, 23 Apr 2022 13:08:50 +0300
In-Reply-To: <20220207084540.3661100-1-quic_chengwan@quicinc.com> (Cheng
 Wang's message of "Mon, 7 Feb 2022 16:45:40 +0800")
Message-ID: <871qxokt71.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_030855_794167_B51F57D2 
X-CRM114-Status: UNSURE (   8.73  )
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
cXVpY2luYy5jb20+Cj4gLS0tCj4gdjI6IGNoYW5nZSBwZXIgY29tbWVudHMgZnJvbSBLYWxsZQo+
ICAgICBmaXhlcyBuZXcgd2FybmluZ3MuCgpJIGhhZCBhbHJlYWR5IG1hZGUgY2hhbmdlcyBpbiB2
MSBzbyBJJ2xsIHVzZSB0aGF0IGluc3RlYWQ6CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMjAxMjUwNjM3MzEuMzA0OTU1Ni0xLXF1
aWNfY2hlbmd3YW5AcXVpY2luYy5jb20vCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2Vy
bmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0t
IAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
