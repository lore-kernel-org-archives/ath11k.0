Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D1DC4332F
	for <ath11k@archiver.kernel.org>; Fri, 16 Dec 2022 03:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+39f+K9QnfzTGSEjUaoE6h8YThbJMn40eAbQiMxMrC0=; b=LHaJYI0HlAPGTv
	AKpYdqsBT4oiVm8vB3BoHJ4TBTfEybxX99FPIdBLdErnzlycQeMKTAXmhOeaF3ywGei/ZBDoYW2ym
	pAPy2UeqkqExRO0v/XTdTjpEDvdWg54EL491IpcGeulKjt3iAvkKpGP2U84tirU/FpTFIo8KtiRoQ
	OLT4oLFdLdCC5AdPv6t1c7MvrREjfKNpfX/ii2Z8hnKVascXV4yjkE2lLUkXckCIsaBH9ivjALJ9Y
	O8sScYv30DAGEXvkWx7M/lfF5++oqcsjua8OEkkzhyeTQ3NSwjb5/vNpGUvPBC5LqKw50+cTQPAFb
	DpgYUGoDOczm8KQHeTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p615q-00CXvH-7g; Fri, 16 Dec 2022 03:09:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p615n-00CXuZ-5m
	for ath11k@lists.infradead.org; Fri, 16 Dec 2022 03:09:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BG2KnhS012413;
	Fri, 16 Dec 2022 03:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=v8Aymr4G+mfcPgVDJEuCZ392GczaMpgm6BxnebUW0Xg=;
 b=XD5DTLFTHcrvhq2cH9LBUtq9PhVSZRasaS6bGXw8kNB+anUDzYPkhlpVziCFxuc/WUlw
 zCwdZLKBoW0l8o58v7UKgFKc86q4kJPcoCd/sj6eDhm2z8Au0J8AN9aXM2ITajI4LWbA
 i2ty7IevQ0gj7YCefB95LBhPiZCoIAo+AUOiRxkbOm7Z4Jn1I4ay5faTiO3AARiGIV2Y
 4zdDDokDj5IwLiuIDPjGF/+wRAQQQsSGjcO1kZQ168QfkfgLUOvXNBiEMPHSPzwymbJM
 noag0Xow+PKobbQTRYfqm+xs7Jk4Wsgu7hdz9e3GySSdieEOZEDQ3v7ZRo6gtBZ4nlKt xQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mfyyu3a1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 03:08:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BG38s4C018200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 03:08:54 GMT
Received: from [10.253.8.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 15 Dec
 2022 19:08:53 -0800
Message-ID: <7bcd1a12-fb60-98cd-1a29-f55efa8d1499@quicinc.com>
Date: Fri, 16 Dec 2022 11:08:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 2/2] wifi: ath11k: reduce the timeout value back for hw
 scan from 10 seconds to 1 second
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
 <20221011072408.23731-3-quic_wgong@quicinc.com> <8735atg335.fsf@kernel.org>
 <cd96eea8-dce0-bcb9-e8ce-05fa0e0f22fb@quicinc.com>
 <e7e34c3d-8b73-f7d5-9ce8-5ed346ca9d28@quicinc.com>
In-Reply-To: <e7e34c3d-8b73-f7d5-9ce8-5ed346ca9d28@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OM3ARP3Le7q85pOff2XFlA-mmfjKExnv
X-Proofpoint-GUID: OM3ARP3Le7q85pOff2XFlA-mmfjKExnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_12,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212160027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_190859_360434_4A70D8DA 
X-CRM114-Status: GOOD (  19.34  )
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

SGkgS2FsbGUsCgpTaG91bGQgSSBjaGFuZ2UgY29tbWl0IGxvZyB3aXRoIGJlbG93IGV4cGxhbmF0
aW9uIGFuZCBzZW5kIHY0PwoKT24gMTEvMjMvMjAyMiAxMTo0MSBBTSwgV2VuIEdvbmcgd3JvdGU6
Cj4gT24gMTEvMTgvMjAyMiA2OjI5IFBNLCBXZW4gR29uZyB3cm90ZToKPj4gT24gMTEvOC8yMDIy
IDY6MjAgUE0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+PiBXZW4gR29uZyA8cXVpY193Z29uZ0BxdWlj
aW5jLmNvbT4gd3JpdGVzOgo+Pj4KPj4gLi4uCj4+PiBbLi4uXQo+Pj4KPj4+PiBAQCAtMzY4Miw3
ICszNjc3LDEyIEBAIHN0YXRpYyBpbnQgYXRoMTFrX21hY19vcF9od19zY2FuKHN0cnVjdCAKPj4+
PiBpZWVlODAyMTFfaHcgKmh3LAo+Pj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gYXRoMTFrX3N0YXJ0
X3NjYW4oYXIsICZhcmcpOwo+Pj4+IMKgwqDCoMKgwqAgaWYgKHJldCkgewo+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBhdGgxMWtfd2Fybihhci0+YWIsICJmYWlsZWQgdG8gc3RhcnQgaHcgc2NhbjogJWRc
biIsIHJldCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgPT0gLUVCVVNZKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF0aDExa19kYmcoYXItPmFiLCBBVEgxMUtfREJHX01BQywK
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzY2FuIGVuZ2luZSBp
cyBidXN5IDExZCBzdGF0ZSAlZFxuIiwgCj4+Pj4gYXItPnN0YXRlXzExZCk7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGVsc2UKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdGgxMWtfd2Fybihh
ci0+YWIsICJmYWlsZWQgdG8gc3RhcnQgaHcgc2NhbjogJWRcbiIsIAo+Pj4+IHJldCk7Cj4+Pj4g
Kwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2tfYmgoJmFyLT5kYXRhX2xvY2spOwo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhci0+c2Nhbi5zdGF0ZSA9IEFUSDExS19TQ0FOX0lETEU7
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsK
Pj4+IFRoaXMgZmVlbHMgbGlrZSBhIGhhY2sgdG8gbWUsIGZvciBleGFtcGxlIHdpbGwgdGhlc2Ug
ZmFpbGVkIHNjYW5zIG5vdwo+Pj4gY2F1c2UgZGVsYXlzIGlzIGNvbm5lY3Rpb24gZXN0YWJsaXNo
bWVudD8gSU1ITyBpdCdzIGNydWNpYWwgZnJvbSB1c2VyJ3MKPj4+IHBvaW50IG9mIHZpZXcgdGhh
dCB3ZSBkb24ndCBkZWxheSB0aGF0IGluIGFueSB3YXkuCj4+IEl0IHdpbGwgbm90IGRlbGF5IGNv
bm5lY3Rpb24uCj4+IEFmdGVyIHdsYW4gbG9hZCwgdGhlIDFzdCBodyBzY2FuIHdpbGwgYXJyaXZl
ZCB0byBhdGgxMWssIGFuZCB0aGVuIDExZAo+PiBzY2FuIHdpbGwgYmUgc2VudCB0byBmaXJtd2Fy
ZSBhZnRlciB0aGUgMXN0IGh3IHNjYW4uIEl0IG1lYW5zIHRoZSBodwo+PiBzY2FuIGZvciBjb25u
ZWN0aW9uIGlzIHJ1biBiZWZvcmUgMTFkIHNjYW4sIGFuZCB0aGVuIGNvbm5lY3Rpb24gY291bGQK
Pj4gYmUgc3RhcnRlZCBpbW1lZGlhdGVseSBhZnRlciB0aGUgMXN0IGh3IHNjYW4gZmluaXNoZWQu
IEl0IG1lYW5zIG5vCj4+IGRlbGF5IGZvciBjb25uZWN0aW9uLgo+Pj4gSSB3b3VsZCByYXRoZXIg
Zml4IHRoZSByb290IGNhdXNlLCBkbyB3ZSBrbm93IHdoYXQncyBjYXVzaW5nIHRoaXM/Cj4+IElu
IGZpcm13YXJlLCBodyBzY2FuIGFuZCAxMWQgc2NhbiBhcmUgYWxsIHJ1bm5pbmcgaW4gdGhlIHNh
bWUgcXVldWUsCj4+IHRoZXkgY2FuIG5vdCBiZSBydW4gcGFyYWxsZWwuCj4+Cj4+IFdoZW4gNiBH
SHogZW5hYmxlZCwgdGhlIDFzdCBodyBzY2FuIGNvc3QgYWJvdXQgN3MgYW5kIGZpbmlzaGVkLCBh
bmQKPj4gdGhlbiAxMWQgc2NhbiBjb3N0IHRoZSBuZXh0IDdzLiBBZnRlciB0aGUgMTRzLCB0aGUg
ZWFjaCBodyBzY2FuIGFycml2ZWQKPj4gdG8gYXRoMTFrIHdpbGwgYmUgcnVuIGltbWVkaWF0ZWx5
LiBJZiB0aGUgMm5kIGh3IHNjYW4gYXJyaXZlZCBiZWZvcmUKPj4gdGhlIDExZCBzY2FuIGZpbmlz
aGVkLCBmb3IgZXhhbXBsZSwgaXQgYXJyaXZlZCA3LjEgc2Vjb25kcyBhZnRlciB0aGUKPj4gMXN0
IGh3IHNjYW4sIGF0IHRoaXMgbW9tZW50LCB0aGUgMTFkIHNjYW4gaXMgc3RpbGwgcnVubmluZyBp
biBmaXJtd2FyZSwKPj4gdGhlbiB0aGUgMm5kIGh3IHNjYW4gd2lsbCBub3QgcmVjZWl2ZSBzY2Fu
IHN0YXJ0ZWQgZXZlbnQgdW50aWxsIHRoZSAxMWQKPj4gc2NhbiBmaW5pc2hlZCwgYW5kIG1lYW53
aGlsZSwgdGhlIDJuZCBodyBzY2FuIGlzIGhvbGRpbmcgdGhlIAo+PiBhci0+Y29uZl9tdXRleAo+
PiBpbiBhdGgxMWtfbWFjX29wX2h3X3NjYW4oKSwgaXQgaXMgbm90IGdvb2QgdG8gaG9sZCBhIGxv
Y2sgZm9yIHNvbWUKPj4gc2Vjb25kcyBiZWNhdXNlIGFyLT5jb25mX211dGV4IGlzIHdpZGVseSB1
c2VkLiBTbyByZWR1Y2UgdGhlIDEwcyB0byAxcwo+PiB0byBhdm9pZCBob2xkaW5nIGFyLT5jb25m
X211dGV4IGZvciBsb25nIHRpbWUuCj4KPiBIaSBLYWxsZSwKPgo+IFNob3VsZCBJIGNoYW5nZSBj
b21taXQgbG9nIHdpdGggYWJvdmUgZXhwbGFuYXRpb24gYW5kIHNlbmQgdjQ/Cj4KCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
