Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2A3C433FE
	for <ath11k@archiver.kernel.org>; Sat, 23 Apr 2022 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWu0vuVjRurWWNe0fIOEgFNU60VMhxq/yLRYWSq9NLQ=; b=SHs3NU+V25/yD0
	+iTrmArAXdR8YVAuXt2lhvAeeTJhH+1yiFFNxBhEyog/TY1IkdoDWMCOESQ9HkglT3LLvvycw64Yc
	wDA5D7w8snyOk3CWu+LpB3eRxtuuhUPpqSaOW6wQv78agv+X8uLWadIO01+hw42rHz1UKVsFjn7ua
	hSfgDGZgpa+ioFGnrJZASy+GODRwymhRx3DPWUiGG0XfG/+3A8AC9961lLXBWOArq+v8335l9MhUM
	I2VfRIQG93UevckQFbnM2VEhgHFUNDZpC7R4LC3unO/fm9MBIBYIdxAGL1h4tbmSxkH1fWvRbuYMW
	mXMvBb2YYt1UxkvjOZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niD4n-0047td-CQ; Sat, 23 Apr 2022 10:33:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niD4e-0047o8-HX
 for ath11k@lists.infradead.org; Sat, 23 Apr 2022 10:33:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBF00B8015B;
 Sat, 23 Apr 2022 10:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF25FC385A0;
 Sat, 23 Apr 2022 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650709983;
 bh=3+MiHjepdSBOzsa4FqtEGwxjolutuhcJAjmMBdk4C60=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ia73tQAm5SbhDJEex+r0sohnFIboOyLGfQIfPeI4e24FmFZaaBpBzug+dKzT2BFjP
 q/fWhjqE/bvcPQS0eh1IVVc5SW1oi62veKK/NhkATb0p5FHq795f962eBZgbpM6GMc
 s4/xwyIo8/H4bfDZ56Kw1NhcDWFxfQZwCg8Z+ZnuhAGiZiHsCC2nifHoVA/9RL1/kL
 TozhP49EwEtLJvO+BGNhJEoz5nbwHS4eiSzl9BA3WD5ZNswmqu5bZxaQuZmNb7QRsC
 7uwZ7kIq38e+SlR14HZgjP0ZjVBzAVuXZMwqcephe+zhXTNcH/VTgPlfZx7VKX0I6l
 o09VPBsbScfQw==
From: Kalle Valo <kvalo@kernel.org>
To: Cheng Wang <quic_chengwan@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: add register read debugfs interface for WCN6855
References: <20220125063731.3049556-1-quic_chengwan@quicinc.com>
 <878rv0ezy5.fsf@kernel.org>
Date: Sat, 23 Apr 2022 13:32:57 +0300
In-Reply-To: <878rv0ezy5.fsf@kernel.org> (Kalle Valo's message of "Fri, 28 Jan
 2022 15:45:38 +0200")
Message-ID: <87tuakjdie.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_033308_938094_F2A4DBF0 
X-CRM114-Status: GOOD (  11.45  )
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

S2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBDaGVuZyBXYW5nIDxxdWlj
X2NoZW5nd2FuQHF1aWNpbmMuY29tPiB3cml0ZXM6Cj4KPj4gQWRkIGRlYnVnZnMgaW50ZXJmYWNl
IHJlZ19hZGRyL3JlZ192YWx1ZSBhbmQgdXNlIHRoZXNlIHR3byBpbnRlcmZhY2VzCj4+IHRvIHJl
YWQgcmVnaXN0ZXIgdmFsdWUuCj4+IEZvciBleGFtcGxlLCBleGVjdXRlIHRoZSBmb2xsb3dpbmcg
Y29tbWFuZHMgdG8gcmVhZCBXQ042ODU1IEhXIHJlZ2lzdGVyIG9mCj4+IOKAnG1lbXR5cGU9MHhh
IG9mZnNldD0weDNhMDBkMOKAnToKPj4KPj4gJCBlY2hvIDB4YSAweDNhMDBkMD5yZWdfYWRkcgo+
PiAkIGNhdCByZWdfdmFsdWUKPj4gMHgxMDIwMDAwMAo+Pgo+PiBUZXN0ZWQtb246IFdDTjY4NTUg
aHcyLjAgUENJIFdMQU4uSFNQLjEuMS0wMTcyMC4xLVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpf
TElURS0xCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoZW5nIFdhbmcgPHF1aWNfY2hlbmd3YW5AcXVp
Y2luYy5jb20+Cj4KPiBUaGlzIGhhZCBuZXcgd2FybmluZ3MsIGZpeGVkIGluIHRoZSBwZW5kaW5n
IGJyYW5jaDoKPgo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvZGVidWdmcy5jOjEy
MDc6IGxpbmUgbGVuZ3RoIG9mIDk2IGV4Y2VlZHMgOTAgY29sdW1ucwo+IGRyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGgxMWsvZGVidWdmcy5jOjEyNTM6IGxpbmUgbGVuZ3RoIG9mIDk0IGV4Y2Vl
ZHMgOTAgY29sdW1ucwo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvZGVidWdmcy5j
OjEzMTg6IGxpbmUgbGVuZ3RoIG9mIDkxIGV4Y2VlZHMgOTAgY29sdW1ucwo+IGRyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGgxMWsvcW1pLmM6MTY3MzogbGluZSBsZW5ndGggb2YgOTQgZXhjZWVk
cyA5MCBjb2x1bW5zCgpJIHRyaWVkIHRvIHRlc3QgdGhpc1sxXSBhbmQgSSBjb3VsZG4ndCBnZXQg
aXQgdG8gd29yazoKCiMgZWNobyAweGEgMHgzYTAwZDA+cmVnX2FkZHIKIyBjYXQgcmVnX3ZhbHVl
IApmYWlsZWQgdG8gcmVhZCByZWcsIGVycj0tMjIKClRoZSBlcnJvciBtZXNzYWdlIGZyb20gYXRo
MTFrIGlzOgoKWyAgOTIzLjYyOTIyMF0gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGF0aDExa19x
bWlfd2xhbmZ3X2F0aGRpYWdfcmVhZF9zZW5kIHN0YXJ0LCBtZW1fdHlwZSAxMCBvZmZzZXQgMHgz
MDAwMDAKWyAgOTIzLjY0NzE1Nl0gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IFFNSSByZXF1ZXN0
IGZhaWxlZCByZXN1bHQ9MCwgZXJyb3I9MCwgdmFsaWQ9MSwgbGVuPTAKCldoaWxlIHJldmlld2lu
ZyB0aGUgcGF0Y2ggSSBmb3VuZCBvdGhlciBpc3N1ZXM6CgpvIGRvIG5vdCB1c2UgYXRoMTFrX2lu
Zm8oKQoKbyBkZWJ1ZyBtZXNzYWdlcyBkb24ndCBmb2xsb3cgYXRoMTFrIHN0eWxlCgpvIHdhcm5p
bmcgbWVzc2FnZXMgZG9uJ3QgZm9sbG93IGF0aDExayBzdHlsZQoKbyBjb252ZXJ0IGFiLT5od19y
ZWcgdG8gc3RydWN0IGF0aDExa19od19wYXJhbXMgZmxhZwoKbyBkb24ndCBwcmludCBhIHdhcm5p
bmcgaWYgcmVnaXN0ZXIgcmVhZCBmZWF0dXJlIGlzIG5vdCBzdXBwb3J0ZWQKCk15IHNldHVwIG9u
IG15IE5VQyBpczoKClsgIDY3OS4yODMxNTZdIGF0aDExa19wY2kgMDAwMDowNjowMC4wOiBNU0kg
dmVjdG9yczogMzIKWyAgNjc5LjI4MzIzMF0gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IHdjbjY4
NTUgaHcyLjAKWyAgNjc5LjQ4NjE4M10gbWhpIG1oaTA6IFJlcXVlc3RlZCB0byBwb3dlciBPTgpb
ICA2NzkuNDg4ODY0XSBtaGkgbWhpMDogUG93ZXIgb24gc2V0dXAgc3VjY2VzcwpbICA2NzkuODkw
NDg2XSBtaGkgbWhpMDogV2FpdCBmb3IgZGV2aWNlIHRvIGVudGVyIFNCTCBvciBNaXNzaW9uIG1v
ZGUKWyAgNjgwLjUzNzM2MF0gYXRoMTFrX3BjaSAwMDAwOjA2OjAwLjA6IGNoaXBfaWQgMHgyIGNo
aXBfZmFtaWx5IDB4YiBib2FyZF9pZCAweDEwNiBzb2NfaWQgMHg0MDBjMDIwMApbICA2ODAuNTM3
NjY5XSBhdGgxMWtfcGNpIDAwMDA6MDY6MDAuMDogZndfdmVyc2lvbiAweDExMGYwYzM1IGZ3X2J1
aWxkX3RpbWVzdGFtcCAyMDIyLTAzLTMwIDA5OjA1IGZ3X2J1aWxkX2lkIFdMQU4uSFNQLjEuMS0w
MzEyNS1RQ0FIU1BTV1BMX1YxX1YyX1NJTElDT05aX0xJVEUtMy42NTEwLjcKClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby9hdGguZ2l0L2Nv
bW1pdC8/aD1wZW5kaW5nJmlkPTI2YzdhNmU0NjhmMjdjMTE1NWZkN2U3Y2M4NjUzZWFiZTQ0Yjk2
NDAKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxl
c3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMv
ZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
