Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3EEEB64D9
	for <ath11k@archiver.kernel.org>; Thu, 15 Jun 2023 02:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqF+8DwR0sFoDb1/ofjh60PIH7Pw62jWkodu4OH/d68=; b=vSgJkbkPRUojts
	n59Xf3lYT0QPZxFD4G0Ki9eL9y8WP33qV8bA+GNdn/0TokiRrMmMucleXzDLLopjCeTUCt4YPFdT2
	9FPPtY8b/WLD7XK3uj8FDe1fNmg0Xy1zMh5iZDJK4Una3UuebnMJDUuYBEyrZTOU2dxf6qj3FljlO
	LY/1TrCb1pbyQBxZlBN9OmqOB10ixmHSKSP60XhP5hpd6HtYgWQnl2+mOzX6gcU2DkZgVRvd7k8LN
	+TTJV1CFHWwWcn//RTLjUBJT9ti7y01tYGVQizDvFclKJBcH9sTasLpUJtOwwWmg+HAxuTdx7bL0B
	3wgJHJrAnujYFGBYMA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9chS-00DMMG-2O;
	Thu, 15 Jun 2023 02:27:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9chP-00DMLY-2w
	for ath11k@lists.infradead.org;
	Thu, 15 Jun 2023 02:27:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F1pW5W031795;
	Thu, 15 Jun 2023 02:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=85CY28qY/Z7AbTsQPkZwoI55W/MMosYt1HZ/RFuZZv4=;
 b=SBaP0vYM3c1bZtokS95AgI5FzxZCGUQzZJSxjVv/RYzbcdRkjsj0f4QryG20OtqpiDcT
 d9qc9YKJnQVjmRvo0jRgbL/e6zHskBoKdwlsOJQn5fxJWobm0UN++gQORPbZ1eHuZSDM
 7QEB1HE0yT0CDnc1gE+oDenThfUgRsYI8A/U/PZt7m49XByqBIzpXlXvd/KfQEKB5+sJ
 XwvgCi+OAAvObxCR6QM5ikrwMMe8DOaP2lUB/BJ7HQ/zmyxDaZAA6LhA3B0fpvUTc+xC
 Qw23z6JPlY4+FzsSRN3CUINNcHqlTK0j1sHR7ZuN2XwOYkcT+tHhgTBSNKaejjEjxnWM Kg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r7ks68hcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 02:26:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35F2QtaW015885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 02:26:55 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 14 Jun
 2023 19:26:54 -0700
Message-ID: <a7093d7a-0179-7b5f-cc61-a501331d35c6@quicinc.com>
Date: Thu, 15 Jun 2023 10:26:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
 <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
 <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
 <1c26c205-0240-7670-117d-02a7af068724@quicinc.com>
 <6f8db032286923845202c7d658f1d39db79a758c.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <6f8db032286923845202c7d658f1d39db79a758c.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nLW19K9csLgH6zPzyLETVEXVFu7LdDv0
X-Proofpoint-GUID: nLW19K9csLgH6zPzyLETVEXVFu7LdDv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=892 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306150017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_192700_095940_F567698A 
X-CRM114-Status: GOOD (  21.37  )
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

Ck9uIDYvMTUvMjAyMyAyOjMyIEFNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+IE9uIFdlZCwgMjAy
My0wNS0yNCBhdCAxNTo0MSArMDgwMCwgV2VuIEdvbmcgd3JvdGU6Cj4+IE1heSBJIGFkZCBhIG5l
dyBvcHMgaW4gc3RydWN0IGllZWU4MDIxMV9vcHM/IGxpa2UgdGhpczoKPj4KPj4gdTE2IGFjdGl2
ZV9saW5rcyhzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodywgc3RydWN0IGllZWU4MDIxMV92aWYgdmlm
LCB1MTYKPj4gbmV3X2xpbmtzKSIKPj4KPj4gdGhlbiBpZWVlODAyMTFfc2V0X3ZpZl9saW5rc19i
aXRtYXBzKCkgY2FsbCB0aGUgb3BzIHRvIGdldCB0aGUgbGlua3MgZm9yCj4+IHN0YXRpb24gYW5k
IHNldCB0aGUgc2RhdGEtPnZpZi5hY3RpdmVfbGlua3Mgd2l0aCB0aGUgcmV0dXJuIHZhbHVlIGZy
b20KPj4gbG93ZXIgZHJpdmVyLAo+PiBpdCBtZWFucyBsb3dlciBkcml2ZXIgd2lsbCBkeW5hbWlj
IHNlbGVjdCB0aGUgbGlua3MgY291bnQgYXQgdGhpcyBtb21lbnQuCj4+Cj4+IElmIGxvd2VyIGRy
aXZlciBub3QgcmVnaXN0ZXIgb3BzIGFjdGl2ZV9saW5rcywgdGhlbiBrZWVwIGN1cnJlbnQgbG9n
aWMuCj4+Cj4gSSBndWVzcyB5b3UgY2FuIGNhbiBzZW5kIHBhdGNoZXMgZm9yIHdoYXRldmVyIHlv
dSB3YW50IDopCj4KPiBCdXQgSSBoYXZlIG5vIGlkZWEgd2hhdCB5b3UncmUgdHJ5aW5nIHRvIGRv
PyBXaHkgd291bGQgeW91IG5lZWQgdG8gaGF2ZQo+IGEgY2FsbGJhY2s/CgpDdXJyZW50bHkgZHJp
dmVyIGNvdWxkIHVzZSBpZWVlODAyMTFfc2V0X2FjdGl2ZV9saW5rc19hc3luYygpIHRvIGFjdGl2
ZSAKbGlua3MgYWZ0ZXIgY29ubmVjdGlvbiBjb21wbGV0ZWQuCgpCdXQgSSB3b3VsZCBsaWtlIHRv
IGFsbG93IGRyaXZlciB0byBzZWxlY3QgYWN0aXZlIGxpbmtzIGluIGEgZWFybHkgdGltZSwgCml0
IHdpbGwgYmUgbW9yZSBjb252ZW5pZW50IGZvciBkcml2ZXIuCgo+Cj4gV2FzIHRoaXMgZm9yIGxp
bmsgc2VsZWN0aW9uIGluIHRoZSBkcml2ZXI/IFdlIHNob3VsZCBoYXZlIGEgcGF0Y2gKPiBzb21l
d2hlcmUgdGhhdCBhZGRzIGEgQlNTX0NIQU5HRSBmbGFnIGZvciB3aGVuIHRoZSB2YWxpZCBsaW5r
cyBjaGFuZ2UsCj4gc28gdGhlIGRyaXZlciBjYW4gc2VsZWN0IG90aGVycy4KPgo+IGpvaGFubmVz
CgpZZXMsIGl0IGlzIGZvciBsaW5rIHNlbGVjdGlvbiBpbiBkcml2ZXIgYXQgYSBlYXJseSB0aW1l
IGJlZm9yZSAKY29ubmVjdGlvbiBjb21wbGV0ZWQuCgpDb3VsZCB5b3UgdGVsbCBkZXRhaWwgYWJv
dXQgaG93IHRoZSBCU1NfQ0hBTkdFIGZsYWcgd29ya3M/8J+YgQoKCi0tIAphdGgxMWsgbWFpbGlu
ZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
