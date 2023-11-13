Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C945C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMxKNGJg7wCkubVo0BEsVzovdEcU9JUK45csWo7dR1Y=; b=CYW/jZ+I8hZpfe
	0Nlrcilo4r39++ivIwWXAN5QThxUz2RWxVaQKqujSxZimOLG9aL9xzx7ap2tWz2ajV/3e4l9K7k+W
	7s33qUX3rzbLgpVmm+BO5A14ay5kd7O8uo0ryOlzl+tJ0CEbPHEXvCyFdWcSq9j30MsNYWHDWskcQ
	u7vhduNjYeCVwdURbjr0IFYgLYOPB0zwie7D7h02AT8uPUzaqZsiKJnsVQsUGgokOdv/KbuuqkdD0
	8eaNnrsOxbIqjszLsPGovNH+NIUwb3QoNoc9/nTE7BAU1cbcxKpRyXaLiqzD9BHeaONhlavd+zQYm
	2ZxWbzylWHQRzfuJMDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Xtz-00E84E-2A;
	Mon, 13 Nov 2023 14:26:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Xtu-00E83k-1o
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 14:26:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADEQOn5013712;
	Mon, 13 Nov 2023 14:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Kxa0v6rsK62hSA77IhoXhkBpBXYgkTMF3T7bmHgOOj8=;
 b=ck+zig0GwQDBuUY+qJZgPX+Hn8lXyVK262lAcPJzJ98Q7Gv6SkJKYehR11k7jHQ5Uqq4
 enPqLy9nBIVze8UUzKAMs4jAjKVWizl88O3EwIIRZXFhezC3FFYLasALnYHYTp9KEVZf
 YBYlBXQfONeY+QiQTgDQd+kEBNvWbISz8K0lYGS36JgFzemGXmjyBAY7Cq/sLOLqpKsW
 9xjCUBTyOz5hnM3sXYXGQplQH++dOgMdWEwXEnAosoZTJfOaBlSiM4tyoScVjJ1dpvQ9
 Huwf3UUTQ0aWDRYGk+0fAWfyEvWBR1JaTwtIDHc2V6Ei39VWPThYSnA+kq8zCqhXPsfD zQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua2wfksj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 14:26:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ADEQl5m000586
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 14:26:47 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 06:26:47 -0800
Message-ID: <fb3709a6-95d2-711f-3ca1-0107fa159c62@quicinc.com>
Date: Mon, 13 Nov 2023 07:26:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Baochen Qiang <quic_bqiang@quicinc.com>, <mhi@lists.linux.dev>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-5-kvalo@kernel.org>
 <f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
 <e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
 <818fddb9-b59e-7a6f-6605-2ba016d0db60@quicinc.com>
 <87msvhu4d5.fsf@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <87msvhu4d5.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N_oti0dSwLYzqAaf4SYfVnX_0rcXhlbF
X-Proofpoint-ORIG-GUID: N_oti0dSwLYzqAaf4SYfVnX_0rcXhlbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_04,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 mlxlogscore=903
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_062654_632278_2DC466A9 
X-CRM114-Status: GOOD (  18.47  )
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

T24gMTEvMTMvMjAyMyA3OjE1IEFNLCBLYWxsZSBWYWxvIHdyb3RlOgo+IEplZmZyZXkgSHVnbyA8
cXVpY19qaHVnb0BxdWljaW5jLmNvbT4gd3JpdGVzOgo+IAo+PiBPbiAxMS8xMS8yMDIzIDk6MjQg
UE0sIEJhb2NoZW4gUWlhbmcgd3JvdGU6Cj4+Cj4+PiBPbiAxMS8xMS8yMDIzIDEyOjU0IEFNLCBK
ZWZmcmV5IEh1Z28gd3JvdGU6Cj4+Pj4gT24gMTEvMTAvMjAyMyAzOjIxIEFNLCBLYWxsZSBWYWxv
IHdyb3RlOgo+Pj4+PiBGcm9tOiBCYW9jaGVuIFFpYW5nIDxxdWljX2JxaWFuZ0BxdWljaW5jLmNv
bT4KPj4+Pj4KPj4+Pj4gVGhlcmUgaXMgbm8gZHJpdmVyIHRvIG1hdGNoIHRoZXNlIHR3byBjaGFu
bmVscywgc28KPj4+Pj4gcmVtb3ZlIHRoZW0uIFRoaXMgZml4ZXMgd2FybmluZ3MgZnJvbSBNSEkg
c3Vic3lzdGVtIGR1cmluZyBzdXNwZW5kOgo+Pj4+Pgo+Pj4+PiBtaGkgbWhpMF9MT09QQkFDSzog
MTogRmFpbGVkIHRvIHJlc2V0IGNoYW5uZWwsIHN0aWxsIHJlc2V0dGluZwo+Pj4+PiBtaGkgbWhp
MF9MT09QQkFDSzogMDogRmFpbGVkIHRvIHJlc2V0IGNoYW5uZWwsIHN0aWxsIHJlc2V0dGluZwo+
Pj4+Cj4+Pj4gVGhpcyBmZWVscyBsaWtlIGp1c3QgbWFza2luZyBhIHJlYWwgaXNzdWUuCj4+Pj4K
Pj4+PiBJZiBMT09QQkFDSyBpcyBub3QgYmVpbmcgY29uc3VtZWQsIHRoZW4gdGhlIGNoYW5uZWwg
c2hvdWxkIG5ldmVyIGdvCj4+Pj4gaW50byB0aGUgc3RhcnQgc3RhdGUuwqAgV2h5IHdvdWxkIHdl
IGJlIHRyeWluZyB0byB0cmFuc2l0aW9uIHRvIHRoZQo+Pj4+IHJlc2V0IHN0YXRlIHRoZW4/Cj4+
Pj4KPj4+PiAtSmVmZgo+Pj4gVGhhdCBpcyBiZWNhdXNlLCB3aXRoIHBhdGNoICdidXM6IG1oaTog
aG9zdDogYWRkIG5ldyBpbnRlcmZhY2VzIHRvCj4+PiBoYW5kbGUgTUhJIGNoYW5uZWxzIGRpcmVj
dGx5JyBpbiB0aGlzIHBhdGNoIHNldCwgYXRoMTFrIGlzIGFibGUgdG8KPj4+IGNhbGwgbWhpX3Vu
cHJlcGFyZV9hbGxfZnJvbV90cmFuc2ZlcigpLCB3aGljaCB3aWxsIHJlc2V0IGFsbAo+Pj4gY2hh
bm5lbHMuCj4+Cj4+IHRoYXQgaW1wbGVtZW50YXRpb24gaXMgZmxhd2VkIGlmIGl0IGlzIGNhdXNp
bmcgdGhpcy4gIExvb2tzIGxpa2UgeW91Cj4+IG5ldmVyIGNoZWNrIHRvIHNlZSBpZiB0aGUgY2hh
bm5lbCB3YXMgcHJlcGFyZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pgo+PiBJZiB5b3UgZ28gZml4
IHRoYXQsIHRoZW4gaXQgbG9va3MgbGlrZSB0aGlzIGNoYW5nZSBpcyBub3QgbmVlZGVkLgo+IAo+
IEJUVyB3aGF0IGRvIHRoZXNlIGxvb3BiYWNrIGNoYW5uZWxzIGRvPyBJIGRpZG4ndCBub3RpY2Ug
YW55IGRpZmZlcmVuY2UKPiBpbiB0aGUgZnVuY3Rpb25hbGl0eSBzbyBJJ20gd29uZGVyaW5nIHRo
ZSByZWFzb24gZm9yIHRoZXNlLgo+IAoKVGhlIGxvb3BiYWNrIGNoYW5uZWwgaXMgZGVmaW5lZCBh
cyBhIHNlcnZpY2Ugd2hlcmUgYW55IGRhdGEgdGhlIGhvc3QgCnNlbmRzIHRvIHRoZSBkZXZpY2Ug
aXMgaW1tZWRpYXRlbHkgc2VudCBiYWNrIHRvIHRoZSBob3N0LCB1bm1vZGlmaWVkLiAKVGhlIHR5
cGljYWwgdXNlY2FzZSBpcyBzbW9rZSB0ZXN0IGFuZCBwZXJmb3JtYW5jZSBwcm9maWxpbmcuCgpJ
IGRvIG5vdCBvYmplY3QgdG8gdGhlIHJlbW92YWwgb2YgdGhlIGNoYW5uZWwgZnJvbSB0aGUgYXRo
ZXJvcyBkZXZpY2VzLCAKYXNzdW1pbmcgc3VpdGFibGUganVzdGlmaWNhdGlvbi4gIE5vdCBoYXZp
bmcgYSB1c2UgZm9yIHRoZSBjaGFubmVsIHNlZW1zIApsaWtlIGdvb2QganVzdGlmaWNhdGlvbi4g
IFdvcmtpbmcgYXJvdW5kIGEgYnVnIHNlZW0gbW9yZSBsaWtlIGEgaGFjayAKdGhhbiBwcm9wZXIg
anVzdGlmaWNhdGlvbi4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTFrCg==
