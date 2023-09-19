Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E7CCD54AD
	for <ath11k@archiver.kernel.org>; Tue, 19 Sep 2023 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PmkfWr+dLnyU0KTp2TsKBjsEPqKqGnZIKKwCp1t3VE=; b=Dk0uvBzuUNRS58
	wR50spZtbhg6bJ40L/IQdiIGmQ3TLb4bFZpB92jUALAnKco0kt4yWxMEzZspnRzOzsjFJ9CFHZk6y
	1L1xnhzpgSSpIN5w0Fe0IObOAVO/lI+Al/Kwor+sK64z4lhHo1SM3bnnaYX8Y+RPuiGQBgeAMb5yC
	QtIeOV7V5oDxSsHG5blanQ/xoXtas+6uR7omDfZoRnu70cZn/zmMmCsY2xdKNT9e9g3RIijbtote7
	LrmWsBTY71F/u0htAfPk+3VQc0zZQfrNpSf68X6I+9uCJi+dKfya5BOsAMWZGKGxp3lWu/WXHYRyT
	4kOsuwlswvxqD/0iv2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXDa-00HWJT-10;
	Tue, 19 Sep 2023 09:40:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXDV-00HWGb-2B;
	Tue, 19 Sep 2023 09:40:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B1D61CE126A;
	Tue, 19 Sep 2023 09:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A781C433C8;
	Tue, 19 Sep 2023 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695116422;
	bh=1W+RHNKneW2lSWYUJv9c0K/rO7LlJrAh0C1ermQDmPM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dYfspwzi29ZpE8TGLJJHwniJ0FECLJuib/RKR7Hy666KEaxriDEmslxjOEAfCnaxI
	 zSYA1GYxhamjWYym4bPvYUC0Q0AZo6m+HoSLT1vcJjZcDW9mztF0XmpOJr0ar/TGGH
	 skHEsbWaGdLXm2gwctjZTyLoOgoEw3OhJeFZUzUki9nbOk0NtDtswAy1g5dQUW3QY0
	 2+0yN5bMzBMWMB3PI326g1n40jKV6fIHlDperqFcYLJok93eqXMNMp6qVEZTvF5TcW
	 fVAHGI3usWzY5c+WiaPLfbomx7S8Rb0WLMGN7I+YIJv+FDRW0oRn1JRaxRSakGuBrR
	 8QyCyIZvKiVnQ==
From: Kalle Valo <kvalo@kernel.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,  Bjorn Helgaas <helgaas@kernel.org>,  Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,  Lukas Wunner
 <lukas@wunner.de>,
  "Rafael J . Wysocki" <rafael@kernel.org>,  Heiner Kallweit
 <hkallweit1@gmail.com>,  Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
  linux-kernel@vger.kernel.org,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  ath12k@lists.infradead.org,
  intel-wired-lan@lists.osuosl.org,  linux-arm-kernel@lists.infradead.org,
  linux-bluetooth@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  linux-rdma@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH v2 10/13] wifi: ath11k: Use pci_disable/enable_link_state()
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
	<20230918131103.24119-11-ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Sep 2023 12:40:15 +0300
In-Reply-To: <20230918131103.24119-11-ilpo.jarvinen@linux.intel.com> ("Ilpo
	=?utf-8?Q?J=C3=A4rvinen=22's?= message of "Mon, 18 Sep 2023 16:11:00
 +0300")
Message-ID: <87il86biww.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_024025_959333_83D8111A 
X-CRM114-Status: UNSURE (   9.60  )
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

SWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPiB3cml0ZXM6Cgo+
IGF0aDExayBkcml2ZXIgYWRqdXN0cyBBU1BNIHN0YXRlIGl0c2VsZiB3aGljaCBsZWF2ZXMgQVNQ
TSBzZXJ2aWNlCj4gZHJpdmVyIGluIFBDSSBjb3JlIHVuYXdhcmUgb2YgdGhlIGxpbmsgc3RhdGUg
Y2hhbmdlcyB0aGUgZHJpdmVyCj4gaW1wbGVtZW50ZWQuCj4KPiBDYWxsIHBjaV9kaXNhYmxlX2xp
bmtfc3RhdGUoKSBhbmQgcGNpX2VuYWJsZV9saW5rX3N0YXRlKCkgaW5zdGVhZCBvZgo+IGFkanVz
dGluZyBBU1BNQyBmaWVsZCBpbiBMTktDVEwgZGlyZWN0bHkgaW4gdGhlIGRyaXZlciBhbmQgbGV0
IFBDSSBjb3JlCj4gaGFuZGxlIHRoZSBBU1BNIHN0YXRlIG1hbmFnZW1lbnQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CgpB
Y2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4KCi0tIApodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2ly
ZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0
aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
