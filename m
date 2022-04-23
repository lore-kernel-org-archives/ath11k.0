Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A96FC433EF
	for <ath11k@archiver.kernel.org>; Sat, 23 Apr 2022 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvU37kk9weXnd4n6ALkkP87+A8qeq5SNRD2BHCXYetU=; b=42YZpqbyjhepp3
	94+voeS3AG2ArVywZjvcXOAC1srlJf5LfFjpXEC6nxwKrUDCO4i6+WxaNFzI4rmxKXM/DoAig+1ty
	FVRiEjTfoIN1jC1wbQla7AVFb3wGJ6HL2yE4sYe7SUO4/wMdWbdqJv7LJmjqz9q7autWQa5AVwoho
	zmpOeSZ5qhHGTU7D6ZXooU+tge8GRDUhbB8q5TB0VElehDKL/QLXBb0EKQ9Is8zK5JgSQvbACKW/4
	b5PIM9d0DPLNOTF4veqk1km4cKMIebQbVkKPJJh/IZHAI9udQz5V7AEdK4MP4h50OWN6JC56YaCp6
	LokzbcTp/IGvu0BsqgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niC5d-003ur9-Ic; Sat, 23 Apr 2022 09:30:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niC5b-003uqj-Ep
 for ath11k@lists.infradead.org; Sat, 23 Apr 2022 09:30:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C919760DF3;
 Sat, 23 Apr 2022 09:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF40FC385A5;
 Sat, 23 Apr 2022 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650706202;
 bh=uYpUk5+sN0P3nqhmmuGUesP6y8QLTNMXcU77kia2qFE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=SmRdB1dO1YCHMLFOBv7Wbz1+hejcLVpMTNWXxgBx0kM5ie60V5M1PnPMhH/K0+66Y
 ttTyc4BEPTKQHH7a/ePsZVnFQ+r5qfd0mgaNIN+7qbBNO+90m3noM5RipkTWUvMebJ
 VQupcuq8YLaRUQxMA9JO0MePDbm5iE012mH+SVUsUwbzgOBA5Lk4jHNVnhbEw8IKUm
 /SXiuQLpoK2O9jEZx8/9U4xd2mk6JQKuEhnSUUjPr/KYkxbmX6QJ2bqcnw0Mxb+Hrw
 qrs3zy/VOZcqjkYpUcx4z+7T5QUbVBf9U+o4NhBiJbQ9yaccXe8IuRJejAb4qgsttL
 bit2ldzNFvpHQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix build warning without CONFIG_IPV6
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220411020843.10284-1-yuehaibing@huawei.com>
References: <20220411020843.10284-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <quic_cjhuang@quicinc.com>, <quic_bqiang@quicinc.com>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165070619766.959.11490520883578406450.kvalo@kernel.org>
Date: Sat, 23 Apr 2022 09:29:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_023003_573707_49F95BA6 
X-CRM114-Status: UNSURE (   6.40  )
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

WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZToKCj4gZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYzo4MTc1OjEzOiBlcnJvcjog4oCYYXRoMTFrX21hY19v
cF9pcHY2X2NoYW5nZWTigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1
bmN0aW9uXQo+ICBzdGF0aWMgdm9pZCBhdGgxMWtfbWFjX29wX2lwdjZfY2hhbmdlZChzdHJ1Y3Qg
aWVlZTgwMjExX2h3ICpodywKPiAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiAKPiBXcmFwIGl0IHdpdGggI2lmZGVmIGJsb2NrIHRvIGZpeCB0aGlzLgo+IAo+IEZpeGVz
OiBjM2MzNmJmZTk5OGIgKCJhdGgxMWs6IHN1cHBvcnQgQVJQIGFuZCBOUyBvZmZsb2FkIikKPiBT
aWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogS2FsbGUgVmFsbyA8cXVpY19rdmFsb0BxdWljaW5jLmNvbT4KClBhdGNoIGFwcGxp
ZWQgdG8gYXRoLW5leHQgYnJhbmNoIG9mIGF0aC5naXQsIHRoYW5rcy4KCjY3ODg4NjMwYWRkZSBh
dGgxMWs6IEZpeCBidWlsZCB3YXJuaW5nIHdpdGhvdXQgQ09ORklHX0lQVjYKCi0tIApodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMjA0
MTEwMjA4NDMuMTAyODQtMS15dWVoYWliaW5nQGh1YXdlaS5jb20vCgpodHRwczovL3dpcmVsZXNz
Lndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3Bh
dGNoZXMKCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
