Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A610C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 00:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nw8Y3hX+Zy3qw/v1U0LQq6IXzauJIywNPwMRpTLR6RI=; b=0Wnz0Y8LLmS+MG
	BuYUDRp/2zgljCPD/8SVRZWUK+zlZqAC9AU6+NYiAwzbRCsePvWcY4uGVzQ+nr0Wr6ZkGe4GF3NF6
	g/mwnaw5KMbOM5X6xG44STXZzoVZcN6NgoX2pCgMHSRUOi+5zOEs3LZytb00GC07CaIMD6Qj7Kx2X
	6xjliIA9aCJpUccvG8G4wSEa2KIQBEZdoakT6ul91bfkuz7H9FyN7ETOYxijEVR9WKAc+bjQHpv7+
	joVOFN8qX0fSNnOSt6D983IzWGm+sM9SB8hJR5u0wgn+2kIdc448Tw4v+kzX7h7w6EQ+bJXkutQFa
	GMSf5EQcisbOXQLbTGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KqZ-00CvIR-2l;
	Mon, 13 Nov 2023 00:30:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2KqW-00CvGv-0C
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 00:30:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AD01mSr012698;
	Mon, 13 Nov 2023 00:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EeU6qUMv8HB30QCXaDKWLTCB1HsZR7ozYqfhbQWOlYc=;
 b=lHrO5pRC5XspjXIxZTUF8PTjpcQYaSN/d9xQR0iap251vEaNcxAYWSLsnp/hgGjg38t3
 PM6lqde5y/7U4durOi/+rhQqwHhxSQnmD5wIZqerxb+ogp4o0wpBhPAz1RdTgqz9bxj5
 iju2FTl79PlKcoHTkgQaM1+Ud1BBvfXZOefl6j1BmpQyibPSXu3MKU9wv91/Rt9dL1OJ
 dafhsmT9say8+7tKEPYChfjKAoZPZmB2Y4RZ7byDE/ACPGlvdufJ3bRzrXaJHXf0pzTl
 KKMue+adY089whMSlh8UvEy6LsUgspDgtqG29LjOcfzcjOiAY+tO0v5bYS13oAMrk00N 8Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua2wfjdmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 00:30:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AD0UMQb024616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 00:30:22 GMT
Received: from [10.253.78.207] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sun, 12 Nov
 2023 16:30:20 -0800
Message-ID: <66902fc0-6f2c-4836-b20c-5d06618b18ad@quicinc.com>
Date: Mon, 13 Nov 2023 08:30:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-5-kvalo@kernel.org>
 <f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
 <e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
 <818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V34-twEaThYlhQaNv2AcRSkyFdAc-mPu
X-Proofpoint-ORIG-GUID: V34-twEaThYlhQaNv2AcRSkyFdAc-mPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 mlxlogscore=670
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_163032_109862_3BDE6EA1 
X-CRM114-Status: GOOD (  15.33  )
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

Ck9uIDExLzEzLzIwMjMgMTI6MTUgQU0sIEplZmZyZXkgSHVnbyB3cm90ZToKPiBPbiAxMS8xMS8y
MDIzIDk6MjQgUE0sIEJhb2NoZW4gUWlhbmcgd3JvdGU6Cj4+Cj4+IE9uIDExLzExLzIwMjMgMTI6
NTQgQU0sIEplZmZyZXkgSHVnbyB3cm90ZToKPj4+IE9uIDExLzEwLzIwMjMgMzoyMSBBTSwgS2Fs
bGUgVmFsbyB3cm90ZToKPj4+PiBGcm9tOiBCYW9jaGVuIFFpYW5nIDxxdWljX2JxaWFuZ0BxdWlj
aW5jLmNvbT4KPj4+Pgo+Pj4+IFRoZXJlIGlzIG5vIGRyaXZlciB0byBtYXRjaCB0aGVzZSB0d28g
Y2hhbm5lbHMsIHNvCj4+Pj4gcmVtb3ZlIHRoZW0uIFRoaXMgZml4ZXMgd2FybmluZ3MgZnJvbSBN
SEkgc3Vic3lzdGVtIGR1cmluZyBzdXNwZW5kOgo+Pj4+Cj4+Pj4gbWhpIG1oaTBfTE9PUEJBQ0s6
IDE6IEZhaWxlZCB0byByZXNldCBjaGFubmVsLCBzdGlsbCByZXNldHRpbmcKPj4+PiBtaGkgbWhp
MF9MT09QQkFDSzogMDogRmFpbGVkIHRvIHJlc2V0IGNoYW5uZWwsIHN0aWxsIHJlc2V0dGluZwo+
Pj4KPj4+IFRoaXMgZmVlbHMgbGlrZSBqdXN0IG1hc2tpbmcgYSByZWFsIGlzc3VlLgo+Pj4KPj4+
IElmIExPT1BCQUNLIGlzIG5vdCBiZWluZyBjb25zdW1lZCwgdGhlbiB0aGUgY2hhbm5lbCBzaG91
bGQgbmV2ZXIgZ28gCj4+PiBpbnRvIHRoZSBzdGFydCBzdGF0ZS7CoCBXaHkgd291bGQgd2UgYmUg
dHJ5aW5nIHRvIHRyYW5zaXRpb24gdG8gdGhlIAo+Pj4gcmVzZXQgc3RhdGUgdGhlbj8KPj4+Cj4+
PiAtSmVmZgo+PiBUaGF0IGlzIGJlY2F1c2UsIHdpdGggcGF0Y2ggJ2J1czogbWhpOiBob3N0OiBh
ZGQgbmV3IGludGVyZmFjZXMgdG8gCj4+IGhhbmRsZSBNSEkgY2hhbm5lbHMgZGlyZWN0bHknIGlu
IHRoaXMgcGF0Y2ggc2V0LCBhdGgxMWsgaXMgYWJsZSB0byAKPj4gY2FsbCBtaGlfdW5wcmVwYXJl
X2FsbF9mcm9tX3RyYW5zZmVyKCksIHdoaWNoIHdpbGwgcmVzZXQgYWxsIGNoYW5uZWxzLgo+Cj4g
dGhhdCBpbXBsZW1lbnRhdGlvbiBpcyBmbGF3ZWQgaWYgaXQgaXMgY2F1c2luZyB0aGlzLsKgIExv
b2tzIGxpa2UgeW91IAo+IG5ldmVyIGNoZWNrIHRvIHNlZSBpZiB0aGUgY2hhbm5lbCB3YXMgcHJl
cGFyZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Cj4gSWYgeW91IGdvIGZpeCB0aGF0LCB0aGVuIGl0
IGxvb2tzIGxpa2UgdGhpcyBjaGFuZ2UgaXMgbm90IG5lZWRlZC4KClN1cmUsIHdpbGwgY2hlY2sg
d2hldGhlciBjaGFubmVsIGlzIGluIE1ISV9DSF9TVEFURV9FTkFCTEVEIHN0YXRlIGluIApuZXh0
IHZlcnNpb24uCgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFr
Cg==
