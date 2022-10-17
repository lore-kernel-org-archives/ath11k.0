Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC40AC4332F
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpp+hpLLWzrS6+WUK0BHy9VDWV1A84x0HkzSct9VVzM=; b=a9DpNZMFBWuy6X
	m+dPjPPAlLxc0dns9yLmJimS0FYyQ1CRpNp8A0Gve5lUeWIc8mEjdNNg2SN5OkJH0CDevDPI7WYey
	bZQNrfaL7OvJgryzOuk654Pq9wHr9HRGwj8Bql8FLzrKFJd3fJ4mtR7PWe5bPbwLjXwEqnOxxpXbo
	lYlDqGbnWvRs0j381YgMSVxZ5o7q3CA1Vhd2LPGm+b1Jt30cmnw5jnZ7iAJv3pfr+W2j+YT2ZWnq9
	H/ZCLwvdm/KD5UbKgf99V/FsJ4S9GMJMkNVF3ApKwnHW1LgC+SmW1289KznWD3kRarIL5UjOYCoqd
	a3oLP2DYK451zjblcaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLFH-008yfo-NX; Mon, 17 Oct 2022 08:13:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLFD-008yVv-Rp
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 08:13:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H76mLa010493;
	Mon, 17 Oct 2022 08:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3d0S8us5fCRajoxspRPCrW3ITmp7ZLBwHZbQkm2wguQ=;
 b=BVm/dr5vERBayUKuTCUv9Y6sowO8MnJnjMCM8LdVe5EYdWsO8ZPDZyu0I4qC9pxtk9XP
 r55KQbrq3OnbOL2rMaBcku7n54JSYWUc1Le/J0TuoDXv0CcxUUiIbvLaGotaR9jcNJp5
 Kq4c7hUEnorVU2wR7U6dOO1ZKs5VXuCx48OR8yV17XITx+reKy500pKU9CJY+t1lL613
 UwiLTluiqxnGaJIfxEQH522ed6YAisx0gpjfKvUkgzMajA45edHxzJLtHJYtg9lSYn7n
 4QWfEszbrRZG/HlEeTj2VwsRTAGqE0XTRb10jezoXVcbZCGIDLo1pYbfyv7bQbfFm3Fh 4w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7nmqv1wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 08:13:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29H8D0vn012931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 08:13:00 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 17 Oct
 2022 01:12:59 -0700
Message-ID: <191042d8-7781-808f-71aa-db76ed763bec@quicinc.com>
Date: Mon, 17 Oct 2022 16:12:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
 <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
 <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
 <2a2c466fbdcc2c3cc7af81bcd4d370d0119ea865.camel@sipsolutions.net>
 <c52e6634-4a90-f165-9f41-8f23df9414a4@quicinc.com>
 <ca0f6ea2d78538ffb6640f2e56d65c89c86f5221.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <ca0f6ea2d78538ffb6640f2e56d65c89c86f5221.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hFcpIhoECYMbq3QemDMzZUrw7UQfmEHF
X-Proofpoint-ORIG-GUID: hFcpIhoECYMbq3QemDMzZUrw7UQfmEHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_011307_938333_D3531525 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMTAvMTcvMjAyMiA0OjAyIFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIE1vbiwgMjAy
Mi0xMC0xNyBhdCAxNjowMCArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+IE9uIDEwLzE3LzIwMjIg
Mzo0OSBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4+IE9uIE1vbiwgMjAyMi0xMC0xNyBhdCAw
OTo0OCArMDIwMCwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+Pj4gQ3Vy
cmVudGx5IGZvciBNTE8gdGVzdCwgdGhlIG90aGVycyBsaW5rcydzIHJ4X25zcyBvZiBzdHJ1Y3QK
Pj4+Pj4+IGllZWU4MDIxMV9saW5rX3N0YSBpcyBzdGlsbCB2YWx1ZSAwIGluIGllZWU4MDIxMV9z
ZXRfYXNzb2NpYXRlZCgpLAo+Pj4+Pj4gYmVjYXVlIHRoZXkgYXJlIG5vdCBwYXNzIGludG8gaWVl
ZTgwMjExX3N0YV9zZXRfcnhfbnNzKCkgaW4KPj4+Pj4+IG1hYzgwMjExIGV4Y2VwdCB0aGUgZGVm
bGluayB3aGljaCBtZWFucyB0aGUgcHJpbWFyeSBsaW5rIGluCj4+Pj4+PiByYXRlX2NvbnRyb2xf
cmF0ZV9pbml0KCkuIFRoaXMgbGVhZCBkcml2ZXIgZ2V0IG5zcyA9IDAgZm9yCj4+Pj4+PiBvdGhl
ciBsaW5rcy4gV2lsbCB5b3UgZml4IGl0IG9yIGlzIGl0IGRlc2lnbiBieSBkZWZhdWx0Pwo+Pj4+
Pj4KPj4+Pj4+IE9ubHkgcHJpbWFyeSBsaW5rIGhhcyB2YWxpZCByeF9uc3MgdmFsdWUgd2hpY2gg
aXMgbm90IDAgYnkgYmVsb3cgY2FsbAo+Pj4+Pj4gc3RhY2suCj4+Pj4+PiBpZWVlODAyMTFfYXNz
b2Nfc3VjY2VzcygpCj4+Pj4+PiAgIMKgwqDCoCAtPnJhdGVfY29udHJvbF9yYXRlX2luaXQoc3Rh
KTsKPj4+Pj4+ICAgwqDCoCDCoMKgwqDCoCAtPmllZWU4MDIxMV9zdGFfc2V0X3J4X25zcygmc3Rh
LT5kZWZsaW5rKTsKPj4+PiBSaWdodCwgbm9uZSBvZiB0aGUgcmF0ZSBzY2FsaW5nIHJlbGF0ZWQg
c3R1ZmYgd2FzIHVwZGF0ZWQgeWV0Lgo+Pj4+Cj4+PiBUaG91Z2ggZm9yIHRoaXMgY2FzZSBtYXli
ZSB3ZSBjYW4ganVzdCBtb3ZlIGllZWU4MDIxMV9zdGFfc2V0X3J4X25zcygpCj4+PiB0byBzb21l
IGJldHRlciBwbGFjZSBvdXRzaWRlIG9mIHJhdGVfY29udHJvbF9yYXRlX2luaXQoKSBhbmQgaGF2
ZSBpdAo+Pj4gZG9uZSB3aXRoIHRoZSByaWdodCBsaW5rLCBhbmQgYWxzbyBvbiBjaGFuZ2VzPwo+
Pj4KPj4+IGpvaGFubmVzCj4+IEkgZGlkIGJlbG93IGNoYW5nZSBpbiBteSBpbnRlcm5hbCB0ZXN0
LCBhbmQgbm90IGZvdW5kIHRoZSBOU1M9MCBpc3N1ZQo+PiBhZ2FpbiBmb3IgMiBsaW5rIE1MTy4K
Pj4KPj4gd2lmaTogbWFjODAyMTE6IHVwZGF0ZSBhbGwgbGlua3MgcnggbnNzIGJ5IGllZWU4MDIx
MV9zdGFfc2V0X3J4X25zcygpIGluCj4+IGllZWU4MDIxMV9hc3NvY19zdWNjZXNzKCkKPj4KPiBJ
IGd1ZXNzIHZhbGlkIGxpbmtzIHdhc24ndCBzZXQgYXQgdGhhdCBwb2ludCB5ZXQ/Cj4KPiBBbnl3
YXkgc2hvdWxkIGFsc28gbW92ZSBvdXQgb2YgcmF0ZV9jb250cm9sX3JhdGVfaW5pdCgpIGFuZCBw
cm9iYWJseQo+IGludG8gc29tZXRoaW5nIGxpa2UgaWVlZTgwMjExX2Fzc29jX2NvbmZpZ19saW5r
KCk/IFRoYXQgYWxyZWFkeSBkb2VzCj4gc29tZSByeF9uc3MgY2FsY3VsYXRpb25zIHdoaWNoIGlz
IHByb2JhYmx5IG5vdCBncmVhdCAuLi4KCk9LLiBJIHdpbGwgdGVzdCB3aXRoIG15IGNoYW5nZSBp
bnRlcm5hbCBub3cuIEFuZCByZXBsYWNlIHRvIHVzZSB1cHN0cmVhbSAKY2hhbmdlCgphZnRlciBz
b21lb25lIGZpeCBpdC4KCj4gam9oYW5uZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
