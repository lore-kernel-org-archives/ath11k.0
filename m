Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA0E6816F
	for <ath11k@archiver.kernel.org>; Tue, 17 Feb 2026 11:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GGbu/FB2E/LQ9APvG7WQkYTPiZVPZ5afjvzCsdsKWB8=; b=gjyt2Ruv4K3nuxAdOyjIJMS/Ih
	yrrij9r0ESJxbdgbA4BIwn459O2Ss27A3kdyeghVrPdFUOJMXCkrKo4pDLoXEQ8mg6mBr2NR39PRv
	wRaQtLL97ls57WMYjHNtkKYfxGS64BqCq1SeU6g395vP6sqK4Q1R/o+c854j/rbLWlLk9JnHTEl0N
	9LOqwytUzH2dtlzwi8k0br154n1WKamd/De37yUV6Hladwm6qgeFVCM+jBnmKfSSyeeHkSI+QYBXA
	09NBRkyBJ4VqHC+KMMIvPsWyGkNxfKE8qkwtZWDNfpjsj8SWx+LVZNUzfVGNdw4wIYoAQBEENpI7x
	6Qb3W26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsItG-000000084mh-3AOO;
	Tue, 17 Feb 2026 11:05:14 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsItE-000000084ly-2QoB
	for ath11k@lists.infradead.org;
	Tue, 17 Feb 2026 11:05:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-65be78011c8so865092a12.3
        for <ath11k@lists.infradead.org>; Tue, 17 Feb 2026 03:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771326310; cv=none;
        d=google.com; s=arc-20240605;
        b=cRc2EEYgo8vai4Rta1Cci3T/zqPzttfRTMJHsEajFHC4Ch2qPe3IUXnfs90bEqiOmk
         fiys0FNAny7cwnuDvoW06VG8flPCwUp61+SNJolSukGOOfNte9rgKkX7of2qsprP3Pv1
         0rITDpbX3Vxiah8pepFxBtbjwjikqkU/VgSDvZ0WZTIMDF5VUsq6mhiyL2CSz/3LUFm6
         BVnZPvsLTFke/z0i0PbACLHUAFJye4iVOixxCznrxDRqLGv6BECTd7ASJ6vcVa+KbIEp
         sQiy/cnC60rRmNY0/YKR5v9VZWTRxxnZ4FoioIK6M3CuM7srY11FByV14/rMh0qppS6d
         U2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=GGbu/FB2E/LQ9APvG7WQkYTPiZVPZ5afjvzCsdsKWB8=;
        fh=e7cO/Kps5b+5KtoB5bGHz1sK14rkUgN8Tf9YoDCrNJg=;
        b=jCh93uUWapLAa0nRovPfrXyTCKf3+rTlniiXaG8rf3S6uMM1Ahu3ontRJtX7Bhy7pJ
         sac/vHPOVxJ+VxL/DmUy9h33cDVFkSq9VDuIsOdX7C64F0I0w4oFxPA89ZBveIfNr5K+
         mEecLbTqX9Nl/gPS7+c3fLl5TYmTA8TqWhaQHNE3LpdZKmLkfhFX+UDhagp08B8zK3pb
         L7mGgu2Pu4pepoZwqURhiEZkRzDhLXIm+CEee46UILRRf11ZtQ9exva43gWuEULAKQfJ
         IIqpjvR5niyFNSJ31RFFTWMPnrnZ9gMD4/E4J1ynNu4VNXtNN7g4tECJ1XKJ9JFsb4So
         W19w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771326310; x=1771931110; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GGbu/FB2E/LQ9APvG7WQkYTPiZVPZ5afjvzCsdsKWB8=;
        b=l45HmaMSE7tZEE1DLERAqaE56SFca7JzLte3r99ZMag6dNAEz5UI+LDBmZkcAno0eI
         cmOELKqw39D6XpcO51bxYX+d+J4k64D9geqddXZUG81VjkM2tWY+c/Eu4tLOafbrFFxV
         QFsShihYus4rOr+vbmbwSJrnwqp/qklM1z1FX+gPsFXeo/QpbiIujxB8BbZSXvOjZa2e
         gL7Q2KgCIcVyWp2+/hdP7KIMSCPLiM/Afj33ZAwX2Ht3lHzVcNU7h/jX+jxt6rcuoHAU
         XTklxH8C+hPI/GAl8xUcuRQUfRustkt1WJvrAHpZQOu2qV14SJi0EKhp4iNGB0mL1+9L
         sKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326310; x=1771931110;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGbu/FB2E/LQ9APvG7WQkYTPiZVPZ5afjvzCsdsKWB8=;
        b=iftS9TpZbQwAfWWSyBgKE0y2vx8jaDnuywP+Rp3aJiUPHsVUkfvpyoIfANDAqz2AfU
         qw+5gjN4mDQ8BiBOPIL3QtRN2nxur0qLN4vEDgGHuvZVXZ5u2uuuMaugbwdxaID6Q1ax
         8MxCw/+/nfvoENa6Kwo3Bg0Oo54ERt9tcyhh68ciEPM10lLNccHSs1m5clBuTUlBDKgh
         ZA6dvI5LSouCxGhDXXncCOyaIHJhFWt2PGxzya3Pg88Sn+cgUZGP6tQRUEIZEVFk82VN
         1LGsrai47xToH4BGheFngSlN+JU8PvuNL2SgW4U0yaYo9olOOZKfYk+rk4mt/ETCW9JS
         QF0A==
X-Gm-Message-State: AOJu0Yw+GSCdGA9HN81EWlzOJUMp1zkEO4hVK6l70xjyv3uKynCML2wC
	AyMNi87Mucd+RIBQLVsSg7N85+kGDYA324+JdGkFp2vMCtAYn8RmHOtxfJVhX4nNiggBemUx6tM
	xN/NCarI3ILuSnxw1iJDC+Fo4InhflJFdJ144
X-Gm-Gg: AZuq6aI/VgtvoWIAhASgwDRD5CtaLR1786uTwZCc3eRA9+3CNHfOkHzixWNIr+sX/cn
	k7PxWjIyzgd/ebsC8dtUlthdtrnnuRY9lEf4a6HYD5tfM3BskTnb5o95GsxqfvZZWaPEnCzDF1U
	OuOUx61EJtHfdIw44vZWyR0xLxioATw5EfqQceLc53G69ZBj3uw3vYBJPgu4ZNQXSeWUBEcaGt2
	Ildh8fWZ7yWX7RJE/grkNUhf5PD18CM5S/EunvZ3xqW4SsarujR8YYqTQXzs55Wsv9vJihFt6aV
	6Qq9j2ZZ9OYgJ4deJhVgNTEKN5Fva1Ca3jNZunrrfrhtevj01iBljXfu+fhZmV4=
X-Received: by 2002:a05:6402:26d4:b0:65c:d00:2ce1 with SMTP id
 4fb4d7f45d1cf-65c0d00310fmr3258095a12.34.1771326309587; Tue, 17 Feb 2026
 03:05:09 -0800 (PST)
MIME-Version: 1.0
From: Aliliche Larbi <alilichelarbi@gmail.com>
Date: Tue, 17 Feb 2026 12:04:58 +0100
X-Gm-Features: AaiRm52G14iKsMYPwhvTlZx7xAt5lu40oVoFE4Lx2J2cOqYpGTINCBjbB_yWfMw
Message-ID: <CAPEqGQqTokFMW41==nrO9rxsr80+JTexN503_X=Dve0Hdn_bRQ@mail.gmail.com>
Subject: ATH11K, firmware CRASH after sending WMI_PEER_CONFIG_VLAN_CMDID
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_030512_662584_86CACA22 
X-CRM114-Status: UNSURE (   8.95  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello all,


I had a crash after trying to send WMI_PEER_CONFIG_VLAN_CMDID to
disable vlan strip  for my inline vlan tag (this later is dropped by
the firmware)



int ath11k_wmi_set_vlan_rx_strip(struct ath11k *ar, const u8 *peer_addr,
+       u32 vdev_id, bool strip)
+{
+ struct ath11k_pdev_wmi *wmi = ar->wmi;
+ struct wmi_peer_config_vlan_cmd_fixed_param *cmd;
+ struct sk_buff *skb;
+ int ret;
+
+ skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
+ if (!skb)
+ return -ENOMEM;
+
+ cmd = (struct wmi_peer_config_vlan_cmd_fixed_param *)skb->data;
+ cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_SET_PARAM_CMD) |
+   FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+ ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
+ cmd->vdev_id = vdev_id;
+ cmd->insert_vlan_tci = 0;
+ cmd->peer_vlan_config_mask = 1 << 1; // indicates setting of vlan rx
+ if (strip)
+ cmd->peer_vlan_config_mask |= 1 << 5; // c_tag (enabled by default)
+
+ ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PEER_CONFIG_VLAN_CMDID);
+ if (ret) {
+ ath11k_warn(ar->ab, "failed to send WMI_PEER_CONFIG_VLAN_CMDID cmd\n");
+ dev_kfree_skb(skb);
+ }
+
+ ath11k_dbg(
+ ar->ab, ATH11K_DBG_WMI,
+ "cmd peer config vlan vdev %d peer 0x%pM set rx strip %d\n",
+ vdev_id, peer_addr, strip);
+
+ return ret;
+}

I called this function after association : WMI_PEER_ASSOC_CONF_EVENTID


I got a crash.:



[  134.881569] AL >>>>>>>>>>>>>> start ath11k_wmi_set_vlan_rx_strip()
[  134.887765] AL >> return in the function ath11k_wmi_set_vlan_rx_strip()
[  134.894382] AL >> start ath11k_wmi_cmd_send()
[  134.898744] AL >> start ath11k_wmi_cmd_send_nowait()
[  134.903716] AL >> get out  ath11k_wmi_cmd_send_nowait()
[  134.908948] AL >> go out from  ath11k_wmi_cmd_send()
[  134.913922] AL >> cmd peer config vlan vdev 0 peer
0x00:09:90:01:5a:17 set tx strip 0
[  134.921762] AL >>>>>>>>>>>>>> out from
ath11k_wmi_set_vlan_rx_strip() with ret=0

But after that , it fails to associate.
135.276059] AL >> go out from  ath11k_wmi_cmd_send()
[  135.281068] AL >> start ath11k_wmi_cmd_send()
[  135.285440] AL >> start ath11k_wmi_cmd_send_nowait()
[  135.290413] AL >> get out  ath11k_wmi_cmd_send_nowait()
[  135.295647] AL >> go out from  ath11k_wmi_cmd_send()
[  136.312790] ath11k_pci 0001:01:00.0: failed to get peer assoc conf
event for 00:09:90:01:5a:17 vdev 0
[  136.322045] ath11k_pci 0001:01:00.0: Failed to associate station:
00:09:90:01:5a:17
[  136.329783] AL >> start ath11k_wmi_cmd_send()
[  136.334150] AL >> start ath11k_wmi_cmd_send_nowait()
[  136.339125] AL >> get out  ath11k_wmi_cmd_send_nowait()
[  136.344358] AL >> go out from  ath11k_wmi_cmd_send()
[  139.384778] ath11k_pci 0001:01:00.0: failed wait for peer deleted
[  139.390904] ath11k_pci 0001:01:00.0: Failed to delete peer:
00:09:90:01:5a:17 for VDEV: 0

[  139.399097] ath11k_pci 0001:01:00.0: Failed to remove station:
00:09:90:01:5a:17 for VDEV: 0
[  139.407544] ath11k_pci 0001:01:00.0: Found peer entry
00:09:90:02:fe:65 n vdev 0 after it was supposedly removed
[  139.417731] ------------[ cut here ]------------
[  139.422354] WARNING: CPU: 1 PID: 3553 at
../mac80211-regular/backports-6.11.2/net/mac80211/sta_info.c:789
sta_info_insert_rcu+0x53c/0x6b8 [mac80211]
[  139.435792] Modules linked in: pppoe ppp_async ath12k(O)
ath11k_pci(O) ath11k(O) qmi_wwan pppox ppp_generic nft_fib_inet
nf_flow_table_inet mac80211(O) ipt_REJECT cfg80211(O) xt_time
xt_tcpudp xt_tcpmss xt_statistic xt_state xt_recent xt_multiport
xt_mark xt_mac xt_limit xt_length xt_hl xt_helper xt_ecn xt_dscp
xt_conntrack xt_connmark xt_connlimit xt_connbytes xt_comment
xt_TCPMSS xt_LOG xt_HL xt_DSCP xt_CLASSIFY xfrm_interface usbnet
ts_kmp ts_fsm ts_bm slhc qrtr_mhi qrtr qmi_helpers(O) nft_reject_ipv6
nft_reject_ipv4 nft_reject_inet nft_reject nft_redir nft_quota
nft_numgen nft_nat nft_masq nft_log nft_limit nft_hash
nft_flow_offload nft_fib_ipv6 nft_fib_ipv4 nft_fib nft_ct nft_compat
nft_chain_nat nf_tables nf_reject_ipv4 nf_nat nf_log_syslog
nf_flow_table nf_conncount mhi mdio_netlink(O) iptable_mangle
iptable_filter ipt_ECN ip_tables crc_ccitt compat(O) cdc_wdm sch_teql
sch_sfq sch_multiq sch_gred sch_fq sch_codel em_text em_nbyte em_meta
em_cmp act_skbmod act_simple act_pedit act_csum libcrc32c act_connmark

[  139.436124]  nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 sch_tbf
sch_ingress sch_htb sch_hfsc em_u32 cls_u32 cls_route cls_matchall
cls_fw cls_flow cls_basic act_skbedit act_mirred act_gact xt_set
ip_set_list_set ip_set_hash_netportnet ip_set_hash_netport
ip_set_hash_netnet ip_set_hash_netiface ip_set_hash_net
ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ipportip
ip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ipmac ip_set_hash_ip
ip_set_bitmap_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set
nfnetlink ip6table_mangle ip6table_filter ip6_tables ip6t_REJECT
x_tables nf_reject_ipv6 bonding ip6_gre ip_gre gre ip6_vti ip_vti
ipcomp6 xfrm6_tunnel esp6 ah6 xfrm4_tunnel ipcomp esp4 ah4 ip6_tunnel
tunnel6 tunnel4 ip_tunnel tun xfrm_user xfrm_ipcomp af_key xfrm_algo
gpy215 ecdh_generic ecc xcbc crypto_user algif_skcipher algif_rng
algif_hash algif_aead af_alg sha512_generic sha256_generic libsha256
sha1_generic seqiv sha3_generic drbg pcbc michael_mic md5 md4 kpp hmac
ehainiv geniv rng ecb des_generic libdes deflate
[  139.526243]  zlib_deflate cts cmac chacha20poly1305 cbc authencesn
authenc arc4 crypto_acompress mii
[  139.625203] CPU: 1 PID: 3553 Comm: hostapd Tainted: G           O
    6.6.62 #0
[  139.632691] Stack : ffffffff81375640 ffffffff80fc86a8
8000000001f6b750 800000002051cd80
[  139.640710]         0000000000000000 80000000239a74f0
ffffffff810fca78 80000000239a74b0
[  139.648725]         0000000000000000 ffffffff81375440
0000000000057fa8 c0000000ffffefff
[  139.656742]         80000000239a7688 0000000000000000
0000000000000000 0000000000000000
[  139.664757]         ffffffff810fca78 0000000000000001
0000000000000000 0000000000000009
[  139.672772]         0000000000000315 0000000000000000
ffffffff81c0bd30 0000000000000003
[  139.680789]         80000000a39a7317 ffffffff80bc3750
0000000000000008 ffffffff81de0008
[  139.688805]         80000000239a4000 80000000239a74f0
ffffffffc07d0430 ffffffff80fc86a8
[  139.696821]         0000000000000000 0000000000000000
0000000000000000 7bec4bfb953bfc00
[  139.704835]         ffffffff810fca78 ffffffff8066308c
80000000032f8000 ffffffff80fc860c
[  139.712852]         ...
[  139.715302] Call Trace:
[  139.717748] [<ffffffff8066308c>] show_stack+0x34/0x100
[  139.722901] [<ffffffff80fc86a8>] dump_stack_lvl+0x58/0x78
[  139.728305] [<ffffffff80684328>] __warn+0xa8/0x168
[  139.733106] [<ffffffff80684530>] warn_slowpath_fmt+0x148/0x1c0
[  139.738948] [<ffffffffc07d830c>] sta_info_insert_rcu+0x53c/0x6b8 [mac80211]
[  139.746063] [<ffffffffc07d84b4>] sta_info_insert+0x2c/0x38 [mac80211]
[  139.752621] [<ffffffffc074bfa8>]
cfg80211_update_owe_info_event+0x16d0/0x1858 [cfg80211]
[  139.760838]
[  139.762348] ---[ end trace 0000000000000000 ]---

