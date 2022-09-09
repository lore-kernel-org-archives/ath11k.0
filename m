Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6E2ECAAD3
	for <ath11k@archiver.kernel.org>; Fri,  9 Sep 2022 04:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNGjLueOeg14LD9uAr8Mn53O3A9OlkQp8kuKNZYKqRA=; b=LiVRHWfof2ZErh
	Ua1gyHv/kZANxVhsIja0cCz3BVHuNvFzP/Sx92GRlMKSX+EQ+mnFAxjGkHHmbzqbJa2aHV6ZwwGF3
	JzYKib0vJKT9a0JJl0wCjrmIHamsh2/zvU/PP99AGHMSRXu4FkU/ZTPIdhE3b5JBGiXYJypiA51mO
	uaxKPjacytpqD52EbUZf+mdjH1GsdoEFYTHk04AmYSvTkctUB/FMpbXghp96Wka+XX+UYROZVNlzo
	0fSOfQAKOeQg5cBDg6eenWaqo/OcSU9LTrp6/kHzVNEN2uhT3C0xSpkyTJjAn60AxyK+DJ/K7ynXQ
	mn8PMFTBykHBgSjsZmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVRQ-00C7QY-9p; Fri, 09 Sep 2022 04:16:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWVRF-00C7AK-SI
	for ath11k@lists.infradead.org; Fri, 09 Sep 2022 04:16:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2893guvX003125;
	Fri, 9 Sep 2022 04:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PB6yekp+T/ib3XA50NMk3ORS4/oPAI/anuoTQSk0ZAQ=;
 b=ZjI35axTOOGXIWOR3QUX/tFcczKcPrDL8fhyt0N1HomRRC8imESOD0ysOdelxbPGAitS
 5JA5lrJxVmfKq8D0oRduEEa0Fi0u/iRy4nGvTP0yIwi1c9v7GNmv0vGit6m4F489QfMe
 mtzc4JcvSYYizTfCodQ6B9fUgZ0SJXNqg3iT+e+p5uSdWt3EyX+Sr7c4SLBkSB4ce+IA
 VAUvK2BahpbjNsiSb2UXsMqiGMsMUfoRsl8hf5qP86VHELQ5wuSD/O6Q3CY4E7CoLOj7
 4kLvP49FzgD3Wj+ajkhur9IOof6DgrXmXxEBR1m1NvmibJgeRnvFleE36MHHwR/Ms0e9 Kw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jfuww89sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 04:16:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2894GJAI024285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Sep 2022 04:16:20 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 8 Sep 2022
 21:16:18 -0700
Message-ID: <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
Date: Fri, 9 Sep 2022 12:16:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WT8bTCDKL4DuDKD5iUXEL1q6861mXSEA
X-Proofpoint-ORIG-GUID: WT8bTCDKL4DuDKD5iUXEL1q6861mXSEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_02,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 phishscore=0 mlxlogscore=850
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209090014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_211621_936161_466C33F1 
X-CRM114-Status: GOOD (  15.93  )
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

T24gOS84LzIwMjIgMTE6NTIgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVGh1LCAyMDIy
LTA5LTA4IGF0IDIzOjUxICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gQW5vdGhlciB0aGluZyBp
cyB3aGF0IGlzIHRoZSBsb2NhbCBNTEQgYWRkciBhbmQgbG9jYWwgcHJpbWFyeSBsaW5rKHNlbmQK
Pj4gYXV0aGVudGljYXRpb24vYXNzb2MgcmVxdXNldCkgYWRkciByZWxhdGlvbj8KPj4gSSB0aGlu
ayB0aGV5IGFyZSBzYW1lIGFkZHJlc3MgZm9yIHN0YXRpb24sIHJpZ2h0Pwo+IE5vLCB0aGV5IGFy
ZW4ndCwgYW5kIHNob3VsZG4ndCBiZS4KSUVFRSBQODAyLjExYmXihKIvRDIuMAozNS4zLjMgTXVs
dGktbGluayBkZXZpY2UgYWRkcmVzc2luZwpBbiBNTEQgaGFzIGFuIE1MRCBNQUMgYWRkcmVzcyB0
aGF0IHNpbmdseSBpZGVudGlmaWVzIHRoZSBNTEQuCkVhY2ggU1RBIGFmZmlsaWF0ZWQgd2l0aCBh
biBNTEQgc2hhbGwgaGF2ZSBhIGRpZmZlcmVudCBNQUMgYWRkcmVzcy4KTk9URSAx4oCUVGhlIE1M
RCBNQUMgYWRkcmVzcyBvZiBhbiBNTEQgbWlnaHQgYmUgdGhlIHNhbWUgYXMgdGhlIE1BQyAKYWRk
cmVzcyBvZiBvbmUgYWZmaWxpYXRlZCBTVEEgb3IgZGlmZmVyZW50CmZyb20gdGhlIE1BQyBhZGRy
ZXNzIG9mIGFueSBhZmZpbGlhdGVkIFNUQS4KClRoaXMgbWVhbnMgdGhlIE1MRCBhZGRyZXNzIGNh
biBiZSBzYW1lIHdpdGggb25lIGxpbmsuCgpJIHN1Z2dlc3QgdG8gc2V0IHByaW1hcnkgbGluayBs
b2NhbCBhZGRyIHNhbWUgd2l0aCBNTEQgYWRkcmVzcyBmb3Igc3RhdGlvbi4KcmVhc29uIGlzOgpX
aGVuIHN0YXRpb24gdXAsIG9uZSBsaW5rIGludGVyZmFjZSBvZiBkcml2ZXIgd2lsbCBiZSBjcmVh
dGVkIHdpdGggdGhlIAphZGRyIG9mIHN0cnVjdCBpZWVlODAyMTFfdmlmLAppdCBpcyB1c2VkIGZv
ciBzY2FuIGFuZCBub24tTUxPIGNvbm5lY3Rpb24uCklmIHN0YXRpb24gc3RhcnQgdG8gZG8gTUxP
IGNvbm5lY3Rpb24gbm93LCB0aGVuIHJhbmRvbSBsb2NhbCBsaW5rIGFkZHIgCndpbGwgYmUgZ2Vu
ZXJhdGVkIGJ5IGJlbG93IGNhbGwgc3RhY2suCmZvciB0aGUgMXN0IGxpbmsuIFRoaXMgbGVhZCBk
cml2ZXIgbXVzdCBjaGFuZ2UgdGhlIGxpbmsgaW50ZXJmYWNlIGxvY2FsIAphZGRyZXNzIHRvIHRo
aXMgcmFuZG9tIGFkZHIuCkFmdGVyIGRpc2Nvbm5lY3QgTUxPIGNvbm5lY3Rpb24sIGRyaXZlciBh
bHNvIG5lZWQgdG8gY2hhbmdlIHRoZSBsaW5rIAppbnRlcmZhY2UgbG9jYWwgYWRkcmVzcyBiYWNr
IHRvCmFkZHIgb2Ygc3RydWN0IGllZWU4MDIxMV92aWYuIEl0IGluY3JlYXNlZCB0aGUgY29tcGxl
eGl0eSBhbmQgZHJpdmVyIApuZWVkIHRvIHN5bmMgdGhlIGxpbmsgaW50ZXJmYWNlCmlmIHRoaXMg
aXMgYSBzY2FuIHJ1bm5pbmcgYXQgdGhpcyBtb21lbnQuCgppZWVlODAyMTFfbWdkX2F1dGgoKQog
wqDCoCDCoC0+aWVlZTgwMjExX3ByZXBfY29ubmVjdGlvbigpCiDCoMKgIMKgwqDCoMKgIC0+aWVl
ZTgwMjExX3ZpZl9zZXRfbGlua3MoKQogwqDCoCDCoMKgwqDCoCDCoMKgwqAgLT5pZWVlODAyMTFf
dmlmX3VwZGF0ZV9saW5rcygpCiDCoMKgIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgLT5pZWVlODAy
MTFfbGlua19zZXR1cCgpCiDCoMKgIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIC0+aWVl
ZTgwMjExX21nZF9zZXR1cF9saW5rKCkKZXRoX3JhbmRvbV9hZGRyKGxpbmstPmNvbmYtPmFkZHIp
Oy8vc2RhdGEtPnUubWdkLmFzc29jX2RhdGEgaXMgbnVsbCBhdCAKdGhpcyBwb2ludAo+PiBBbmQg
dGhlIG90aGVycyBsb2NhbCBsaW5rIGFkZHJlc3MgaXMgcmFuZG9tIGdlbmVyYXRlZCBieSBldGhf
cmFuZG9tX2FkZHIKPj4gaW4gaWVlZTgwMjExX21nZF9hc3NvYygpICwgcmlnaHQ/Cj4gWWVzLCBh
dCBsZWFzdCBmb3Igbm93IGFsbCB0aGUgbGluayBhZGRyZXNzZXMgYXJlIHJhbmRvbWx5IGdlbmVy
YXRlZC4KPgo+IGpvaGFubmVzCj4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vYXRoMTFrCg==
