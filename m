Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C198C7618D
	for <ath11k@archiver.kernel.org>; Tue,  4 Apr 2023 02:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9+gre2EJlwM0dZTgZB4pvnINvAXXLZOtP9FOXtkM1k=; b=XMNpMP/ckw/1ue
	Z/G61oIc65Pt3UT8hQXF5cfKPvxR2nJrwPcIlTozqx6V/J1pbiAKesJeaus8Wk3I9J41BlPmu77JR
	NtOR3FloHBU7Xbvr/RCwCbd7GyqDf6drFoIhC5MDYCwnDky5E9I+sLUvL0qvANyKNtry01PVOOZVA
	aQHPQIPSXcSsbzHDPL4oUZQgJnhhEDeHdyJjczNKgYkmbyPZvdQ3aKaCZeUguF2WNd5l+tmyoAmFG
	jEqXjSE4ttBKUgFvATRYyiPulb8zJsEKrY+Zz8rK816iZHnbxxSF0Rdke/WlyvV7vdQ6DJeCm9E13
	Puqxf7GdYdX509bA1+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjWoH-00HTou-2g;
	Tue, 04 Apr 2023 02:54:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjWoF-00HTo8-1O
	for ath11k@lists.infradead.org;
	Tue, 04 Apr 2023 02:54:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3342nAIi012868;
	Tue, 4 Apr 2023 02:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YO8xpiiFRkM7ohelTiAjHSXvuPCQhgmTSseP61xd34g=;
 b=k8eoRsbhK5z3D/5bBqJD7qcx6wwXvKcSQImV8iDwZFHC4MtsuqlxzzDLH62AvSNw9v3/
 W/GZeNXd4BVwt1rm66YOYpuWmBeoMSoU+qvqg9DyDLjThOEf8lTGYCno4Z0NaCo32cYL
 +M+XKYtuwY60ooONa6+jmwGshs904Yg26RoZpRezNyH2jvVFi48VN+VFKJxE+5hG1qvY
 jqWubu9HDu1eOBPNn/XzGiRLpgqW/5LaCaIqGqH2YqkR+T3iNRgsVNtKLL16WU7f0Nk2
 uXcHav0AbTXnxyYMfmH9c/UwStWE1yp9nuCqnLgTpv650fCmnpReeO1H4wJ4TTAGDC6p HQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqus5a919-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 02:54:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3342s8p3014952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Apr 2023 02:54:08 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 19:54:07 -0700
Message-ID: <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
Date: Tue, 4 Apr 2023 10:54:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <2de44394-cb93-7be4-481f-2d92788b8d28@quicinc.com>
 <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
 <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
 <545227cf18baac94ea8aa24dc08b250c47949541.camel@sipsolutions.net>
 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
 <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
 <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lnsgSqN0jOsGDySGRdk1atThTXzp55E5
X-Proofpoint-GUID: lnsgSqN0jOsGDySGRdk1atThTXzp55E5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_19,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=808
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_195411_597952_CA968576 
X-CRM114-Status: GOOD (  13.07  )
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

T24gMTAvMTEvMjAyMiAzOjI2IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIFR1ZSwgMjAy
Mi0xMC0xMSBhdCAxMjowNyArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+IE9uIDkvMjgvMjAyMiAx
MToyOCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4gLi4uCj4+Pj4gTWF5IEkga25vdyBzb21l
IG1vcmUgaW5mby9zdGF0dXMgYWJvdXQgdGhlICJpbmNvbWluZ8KgIG5ldyBtZXRob2QgdG8gbGV0
Cj4+Pj4gZHJpdmVycyBzZXQgdGhlIGxpbmsgYWRkcmVzcyI/Cj4+Pj4KPj4+IEkgd2Fzbid0IGFj
dHVhbGx5IHBsYW5uaW5nIHRvIHdvcmsgb24gdGhhdCBteXNlbGYsIEZXSVcuCj4+Pgo+Pj4gam9o
YW5uZXMKPj4gT0suIFNvIGhhcyBzb21lIGJvZHkgd2lsbCB3b3JrIGZvciB0aGF0IG5vdz/wn5iB
Cj4+Cj4gWWVzLCBJIGRvbid0IHBlcnNvbmFsbHkgaGF2ZSBhIG5lZWQgZm9yIGFueXRoaW5nIG90
aGVyIHRoYW4gd2hhdCB3ZSBoYXZlCj4gcmlnaHQgbm93LgoKTWF5IEkgYWRkIG1ldGhvZCB0byBs
ZXQgbG93LWRyaXZlcnMgc2V0IHRoZSBwcmltYXkgbGluayBhZGRyZXNzIGxpa2UgYmVsb3c/CgpJ
IGFkZCBhIGZpZWxkIGluIHN0cnVjdCB3aXBoeV9pZnR5cGVfZXh0X2NhcGFiLCBpZiBpdCBpcyB2
YWxpZCwgdGhlbiBpdCAKd2lsbCBiZSB1c2VkIGFzCgpsb2NhbCBwcmltYXJ5L2Fzc29jIGxpbmsg
YWRkciBpbiBmdW5jdGlvbiBpZWVlODAyMTFfbWdkX3NldHVwX2xpbmsoKSBmb3IgCnN0YXRpb24u
CgotLS0gYS9pbmNsdWRlL25ldC9jZmc4MDIxMS5oCisrKyBiL2luY2x1ZGUvbmV0L2NmZzgwMjEx
LmgKQEAgLTUwNzksNiArNTA3OSw3IEBAIHN0cnVjdCB3aXBoeV9pZnR5cGVfZXh0X2NhcGFiIHsK
IMKgwqDCoMKgwqDCoMKgIHU4IGV4dGVuZGVkX2NhcGFiaWxpdGllc19sZW47CiDCoMKgwqDCoMKg
wqDCoCB1MTYgZW1sX2NhcGFiaWxpdGllczsKIMKgwqDCoMKgwqDCoMKgIHUxNiBtbGRfY2FwYV9h
bmRfb3BzOworwqDCoMKgwqDCoMKgIHN0cnVjdCBtYWNfYWRkcmVzcyBhc3NvY19saW5rX2FkZHI7
CiDCoH07CgouLi4KCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEx
awo=
